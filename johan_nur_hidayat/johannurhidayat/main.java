class Player{

    private String name ;
    private int baseHealth;
    private int baseAttack;
    private int incrementAttack;
    private int incrementHealth;
    private int level ;
    private int totalDamage ;
    private Armor armor ;
    private Weapon weapon ;
    private Bool isAlive ;

    public Player(String name ){
        this.name = name;
        this.baseHealth = 100;
        this.baseAttack = 100;
        this.level = 1;
        this.incrementHealth = 20;
        this.incrementAttack = 20;
        this.isAlive = true;

    }
    public String getName(){
        return this.name;

    }

    public int getHeatlh(){
        return this.getHeatlh - this.totalDamage 
    }

    private void display(){
        System.out.println("Player\t\t : " + this.name);
        System.out.println("Level\t\t : " + this.level);
        System.out.println("MaxHealth\t : " +this.getHeatlh( )+"/"+ this.maxHealth());
        System.out.println("Attack\t : " + this.getAttackPower());
        System.out.println("Alive\t : " + this.isAlive());
    } 

    public void attack(Player opponent){

      int damage = this.getAttackPower();
      System.out.println("Player\t\t: "  + this.name + "is attacking\t\t: " + opponent.getName()+ "with " +damage +"\n")
      opponent.defence(damage);
      this.levelUp();
    }


    public void defence(int damage){
        int deltaDamage = this.arnor.getdefencePower();
        int defencePower

        System.out.println(this.name +"defence power = " +defencePower)
        if(damage > defencePower){
            deltaDamage = damage - defencePower;
        }else{
            deltaDamage = 0;
        }

        System.out.println("damage earned = "+deltaDamage)
        this.totalDamage += this.deltaDamage;
        if(this.getHeatlh() <= 0){
            this.isAlive = false;
            this.totalDamage = this.maxHealth();
        }
        this.display();
    }


    public int getAttackPower(){
        return this.baseAttack +this.level*this.incrementAttack + this.weapon.getAttack()

    } 
    public  void levelUp(){
        this.level++;
    }

    public void setArmor( Armor armor){
        this.armor = armor;
    }
    public void setWeapon(Weapon weapon){
        this.weapon = weapon;
    }

    public int maxHealth(){
        return this.baseHealth +this.level*this.incrementHealth + this.armor.getAddStrength()

    } 


}
class weapon {
    private String name;
    private int attack; 

    public Weapon (String name, int attack){
        this.name = name;
        this.attack = attack;
    }

    public int getAttack(){
        return this.attack;
    }
}
class Armor{
    private String name;
    private int strength;
    private int health

    public Armor (String name, int strength, int health){
        this.name = name;
        this.strength = strength;
        this.health = health;

    }

    public int getAddStrength(){
        return this.strength*10 + this.health;
    }

    public int getdefencePower(){
        return this.strength*2;
    }

}


public class main{
    public static void main( String[] args) {
        System.out.println("test");

        Player player1 = new Player("Marni");
        Armor armor1 = new Armor("Baju besi",5,100);
        Weapon weapon1 = new Weapon("Pedang",20);
        player1.setArmor(armor1);
        player1.setWeapon(weapon1);

        Player player2 = new Player("Marni");
        Armor armor2 = new Armor("Baju besi",5,100);
        Weapon weapon2 = new Weapon("Pedang",20);
        player1.setArmor(armor2);
        player1.setWeapon(weapon2);

        player1.display();
        player2.display();

        player1.attack(player2);
        player2.attack(player1);
    }
}