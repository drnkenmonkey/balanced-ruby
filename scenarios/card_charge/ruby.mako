% if mode == 'definition':
Balanced::Marketplace.cards

% else:
require 'balanced'
Balanced.configure('8af725c6d54611e2bf5e026ba7f8ec28')

card = Balanced::Card.new(
  card_number:      '4111111111111111',
  expiration_year:  '2016',
  expiration_month: '12')
card.save

# associate card to account
Balanced::Account.new(email_address: 'user@example.com', name: 'John Doe', card_uri: card.uri).save

card = Balanced::Card.find(card.uri)
card.debit(amount: 10000).should be_instance_of Balanced::Debit


% endif
