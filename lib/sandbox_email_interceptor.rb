class SandboxEmailInterceptor
  def self.delivering_email(message)
    message.to = ENV['SANDBOX_EMAIL'] || 'test@example.com'
  end
end
