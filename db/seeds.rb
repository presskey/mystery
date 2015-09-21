admin = User.create(username: 'admin', password: 'password', admin: true)
user1 = User.create(username: 'user1', password: 'password')
user2 = User.create(username: 'user2', password: 'password')

four_winds_spell = Spell.create(
  user: user1,
  name: 'Four Winds',
  description: 'This is a herbal spell which also honours the four directions'
)

four_winds_spell.ingredients.create([
  { name: 'dried herbs', quantity: 10 },
  { name: 'small bowl', quantity: 1 }
])

joyful_candle_spell = Spell.create(
  user: user1,
  name: 'Joyful Candle',
  description: 'By using this spell you can bring some joy into ur life by the power of fire'
)

joyful_candle_spell.ingredients.create([
  { name: 'orange candle', quantity: 3 },
  { name: 'rosemary', quantity: 1 },
  { name: 'cedar oil', quantity: 100 }
])

flame_sword_spell = Spell.create(
  user: user2,
  name: 'Flame Sword',
  description: 'This is for pay-back to fight back when someone do something bad to you'
)

flame_sword_spell.ingredients.create([
  { name: 'white candle', quantity: 4 }
])
