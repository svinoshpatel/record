type Creature = record
  Name: string;
  Health: Integer;
  Damage: Integer;
  AidKits: Integer;
end;

var
  Enemy: Creature;
  Player: Creature; 
  ans: String;
  dmg: Integer;

procedure attack(Attacker: Creature; var Target: Creature; var dmg: Integer);
begin
  dmg := random(30) + Attacker.Damage;
  Target.Health := Target.Health - dmg;
end;

procedure heal(var Target: Creature);
begin
  Target.Health := Target.Health + random(30);
  if Target.AidKits < 1 then
  begin
    writeln('You ran out of aid kits!');
    exit;
  end;
  if Target.Health > 100 then
    Target.Health := 100;
  Target.AidKits := Target.AidKits - 1;
end;

begin
  Randomize;
  with Enemy do
  begin
    Name := 'Pig';
    Health := 100;
    Damage := 10;
  end;


  write('Enter you name: ');
  with Player do
  begin
    readln(Name);
    Health := 100;
    Damage := 15;
    AidKits := 3;
  end;

  while (Player.Health > 0) and (Enemy.Health > 0)  do
  begin
    // Player's move
    writeln('[1] Attack ', Enemy.Name);
    writeln('[2] Heal yourself | ', Player.AidKits);
    while True do
    begin
      write('--> ');
      readln(ans);
      case ans of
        '1': 
          begin
            attack(Player, Enemy, dmg);
            writeln('You attacked ', Enemy.Name, ' dealing ', dmg, ' damage');
            writeln(Enemy.Name, ' Health: ', Enemy.Health);
            break;
          end;
        '2': 
          begin
            heal(Player);
            writeln('You healed your wounds');
            writeln('Your Health: ', Player.Health);
            break;
          end
      else
        writeln('[wrong option]');
      end
    end;      
    if Enemy.Health <= 0 then
      break;
    // Enemy reaction
    attack(Enemy, Player, dmg);
    writeln(Enemy.Name, ' attacked you dealing you ', dmg, ' damage');
    writeln('Your Health: ', Player.Health);
  end;

  if Player.Health <= 0 then
    writeln('You Died')
  else
    writeln(Enemy.Name, ' Has been defeated');
end.
