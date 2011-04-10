class ContactMailer < MailForm::Base
  attribute :name,          :validate   => true
  attribute :email,         :validate   => /[^@]+@[^\.]+\.[\w\.\-]+/
  attribute :support_type,  :validate   => ["General Support", "Questions or Concerns", "Image Change"]
  attribute :message,       :validate   => true
  attribute :screenshot,    :attachment => true, :validate => :interface_bug?
  attribute :nickname,      :captcha    => true
  
  def interface_bug?
    if support_type == 'Image Change' && screenshot.nil?
      self.errors.add(:screenshot, "can't be blank for Image Change")
    end
  end

  def headers
    {
      :subject => "New #{support_type} Request",
      :to      => 'admin@pieceofthefuture.org',
      :from    => %("#{name}" <#{email}>)
    }
  end
end
