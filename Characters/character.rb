require_relative '../world'
class Character

  def initialize(type, name)
    if type == :fighter
      data = [:strength, :constitution, :dexterity, :intelligence, :charisma, :wisdom]
    elsif type == :wizard
      data = [:intelligence, :constitution, :dexterity, :charisma, :strength, :wisdom]
    elsif type == :rogue
      data = [:dexterity, :strength, :constitution, :intelligence, :charisma, :wisdom]
    end

    @potions = 3
    @name = name
    @_class = type
    @stats = set_stats(data)
    @health = set_health
  end

  def set_stats(data)
    numbers = top_6
    Hash[data.zip(numbers)]
  end

  def top_6
    numbers = []
    18.times do
      numbers << rand(1..6) + rand(1..6) + rand(1..6)
    end
    numbers.sort!.reverse!
    numbers.first(6)
  end

  def stats
    @stats
  end

  def _class
    @_class
  end

  def name
    @name
  end

  def stat_bonus(stat)
    if @stats[stat] > 23
      bonus = 10
    elsif @stats[stat] > 21
      bonus = 6
    elsif @stats[stat] > 19
      bonus = 5
    elsif @stats[stat] > 17
      bonus = 4
    elsif @stats[stat] > 15
      bonus = 3
    elsif @stats[stat] > 13
      bonus = 2
    elsif @stats[stat] > 11
      bonus = 1
    elsif @stats[stat] > 9
      bonus = 0
    else
      bonus = -1
    end
    bonus
  end

  def potions
    @potions
  end

  def use_potion
    if @potions > 0
      @potions -= 1
      gain_health(World.dice.roll_d8)
    else
      puts 'You are out of potions.'
    end
  end

  def set_health
    @health = @stats[:constitution]
  end

  def lose_health(damage)
    @health -= damage
  end

  def gain_health(healing)
    @health += healing
    if @health > @stats[:constitution]
      set_health
    end
  end

  def health
    @health
  end

  def lower_stat(stat, value)
    @stats[stat] -= value
  end

  def raise_stat(stat, value)
    @stats[stat] += value
  end

  def set_ac(ac)
    @armor_value = ac
  end

  def armor_value
    @armor_value
  end

  def set_armor(armor)
    @armor = armor
  end

  def set_weapon(weapon)
    @weapon = weapon
  end

  def armor
    @armor
  end

  def weapon
    @weapon
  end

  def set_damage(dx)
    @weapon_dice = dx
  end

  def do_damage
    @damage_done = 0
    @attack_nums.times do
      @damage_done += World.dice.roll_d(@weapon_dice)
    end
    @damage_done += stat_bonus(:strength)
  end

  def attack
    World.dice.roll_d20 + stat_bonus(:strength)
  end

  def armor_up(armor, ac, value)
    set_armor(armor)
    set_ac(ac)
    lower_stat(:dexterity, value)
  end

  def weapon_up(weapon, dx, a_num, stat_num)
    set_weapon(weapon)
    set_damage(dx)
    raise_stat(:strength, stat_num)
    @attack_nums = a_num
  end

  def hit_text(damage)
    text = ["You swing your #{gear_to_s(weapon)} at the monster cutting deep into its flesh dealing #{damage} damage!",
            "You decide to go old school and holstering your #{gear_to_s(weapon)}, you grab the monster and perform a perfect suplex doing #{damage} damage!",
            "You mercilessly beat the monster with your fists dealing #{damage} damage!",
            "You feint low and instead bring your #{gear_to_s(weapon)} high bringing it down on the monster's head doing #{damage} damage to the creature!",
            "You unbalance the monster with a well placed kick and slice across dealing #{damage} damage!",
            "With a great show of strength you roundhouse kick the monster to the ground and bring down your #{gear_to_s(weapon)} on top of it doing #{damage} damage!"]
    num = rand(0..5)
    text[num]
  end

  def miss_text
    text = ["You swing your #{gear_to_s(weapon)} but it narrowly misses the monster.",
            "You barely miss the monster.",
            "The monster deflects your blow."]
    num = rand(0..2)
    text[num]
  end

end