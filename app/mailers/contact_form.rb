class ContactForm < MailForm::Base
  attribute :name,                      :validate   => true
  attribute :email,                     :validate   => false
  attribute :confirmation,              :validate   => false
  attribute :school,                    :validate   => false
  attribute :classroom,                 :validate   => false
  attribute :custom_classroom_name,     :validate => false
  attribute :custom_classroom_teacher,  :validate => false
  attribute :custom_classroom_school,   :validate => false
  attribute :ad_url,                    :validate   => false
  attribute :graph_image,               :attachment => true, :validate => true
  attribute :ad_image,                  :attachment => true, :validate => false
  attribute :nickname,                  :captcha    => true
  attribute :donation_id,               :validate   => false

  def headers
    {
      :subject => 'New Donation',
      :to      => 'images@pieceofthefuture.org',
      :from    => %("#{name}" <#{email}>)
    }
  end
end
