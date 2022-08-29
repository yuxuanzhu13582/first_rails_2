require 'digest'

class User < ApplicationRecord
    # validates :name, presence: true                 #第一種寫法
    # validates_presence_of :name                       #第二種寫法

    validate :name_validator
    # before_create :encrypt_email

    private
    def name_validator
        unless name.starts_with? 'Ruby'
            errors[:name] << "必須是 Ruby 開頭喔!"
        end
    end

    #可以在建立使⽤者資料之前，先對 email 進⾏ MD5 加密。
    # def encrypt_email
    #     self.email = Digest::MD5.hexdigest(email)
    # end

end
