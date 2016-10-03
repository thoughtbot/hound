module Features
  def screenshot
    if example.metadata[:js]
      name = Time.now.strftime('%Y-%m-%d-%H-%M-%S-%L')
      path = Rails.root.join(Capybara.save_and_open_page_path, "#{name}.png")
      Launchy.open(path.to_s)
    else
      message = 'screenshot can only be used in JavaScript feature specs'
      raise ArgumentError, message
    end
  end
end
