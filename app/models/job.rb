class Job < ApplicationRecord
  # belongs_to :user
  has_many :job_applications, dependent: :destroy
  # validates :title, :company, :twitter_link, :discord_invite, :description, :chain, presence: true
  paginates_per 5
  belongs_to :company, class_name: 'Company', foreign_key: 'company_id'
  # validates :chain, inclusion: { in: ['Ethereum', 'Polygon', 'Solana', 'Binance Smart Chain', 'Avalanche', 'Fantom', 'Harmony', 'Kusama', 'Polkadot', 'Celo', 'Near', 'Tezos', 'Klaytn', 'Tron', 'Waves', 'EOS', 'Algorand', 'Stellar', 'Cardano', 'Other'] }

  # CHAIN = ['Ethereum', 'Polygon', 'Solana', 'Binance Smart Chain', 'Avalanche', 'Fantom', 'Harmony', 'Kusama', 'Polkadot', 'Celo', 'Near', 'Tezos', 'Klaytn', 'Tron', 'Waves', 'EOS', 'Algorand', 'Stellar', 'Cardano', 'Other']

  def num_applications
    self.job_applications.length
  end


end
