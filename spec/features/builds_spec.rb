require 'spec_helper'

feature 'Builds' do
  let(:payload) do
    File.read('spec/support/fixtures/pull_request_synchronize_event.json')
  end
  let(:parsed_payload) { JSON.parse(payload) }
  let(:repo_name) { parsed_payload['repository']['full_name'] }
  let(:repo_id) { parsed_payload['repository']['id'] }
  let(:pr_sha) { parsed_payload['pull_request']['head']['sha'] }
  let(:pr_number) { parsed_payload['number'] }

  context 'with payload nesting' do
    scenario 'a successful build with custom config' do
      repo = create(:repo, github_id: repo_id, full_github_name: repo_name)
      stub_github_requests(repo.full_github_name, pr_sha)

      page.driver.post builds_path, payload: payload

      expect_no_comment_request(repo.full_github_name, pr_number)
    end
  end

  context 'without payload nesting' do
    scenario 'a successful build with custom config' do
      repo = create(:repo, github_id: repo_id, full_github_name: repo_name)
      stub_github_requests(repo.full_github_name, pr_sha)

      page.driver.post builds_path, payload

      expect_no_comment_request(repo.full_github_name, pr_number)
    end
  end

  scenario 'a failed build' do
    repo = create(:active_repo, github_id: repo_id, full_github_name: repo_name)
    stub_request(
      :post,
      'https://api.github.com/repos/salbertson/life/pulls/2/comments'
    )
    stub_commit_request(
      repo.full_github_name,
      pr_sha,
      ENV['HOUND_GITHUB_TOKEN']
    )
    stub_contents_request(
      ENV['HOUND_GITHUB_TOKEN'],
      repo_name: repo.full_github_name,
      sha: pr_sha,
      file: 'file1.rb',
      fixture: 'contents_with_violations.json'
    )
    stub_contents_request(
      ENV['HOUND_GITHUB_TOKEN'],
      repo_name: repo.full_github_name,
      sha: pr_sha,
      file: '.hound.yml',
      fixture: 'config_contents.json'
    )

    page.driver.post builds_path, payload: payload

    expect_a_comment_request(repo.full_github_name, pr_number)
  end

  def stub_github_requests(full_github_name, pull_request_number)
    stub_commit_request(
      full_github_name,
      pr_sha,
      ENV['HOUND_GITHUB_TOKEN']
    )
    stub_contents_request(
      ENV['HOUND_GITHUB_TOKEN'],
      repo_name: full_github_name,
      sha: pr_sha,
      file: 'file1.rb',
      fixture: 'contents.json'
    )
    stub_contents_request(
      ENV['HOUND_GITHUB_TOKEN'],
      repo_name: full_github_name,
      sha: pr_sha,
      file: '.hound.yml',
      fixture: 'config_contents.json'
    )
  end

  def expect_a_comment_request(repo_name, pull_request_number)
    expect(
      a_request(:post, comment_url(repo_name, pull_request_number))
    ).to have_been_made
  end

  def expect_no_comment_request(repo_name, pull_request_number)
    expect(
      a_request(:post, comment_url(repo_name, pull_request_number))
    ).not_to have_been_made
  end

  def comment_url(full_repo_name, pull_request_number)
    "https://api.github.com/repos/#{full_repo_name}/pulls/#{pull_request_number}/comments"
  end
end
