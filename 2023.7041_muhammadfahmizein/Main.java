import java.util.Random;

class Player {
    private String name;
    private int baseHealth;
    private int baseAttack;
    private Armor armor;
    private Weapon weapon;
    private int level;
    private int incrementHealth;
    private int incrementAttack;
    private int currentHealth;

    public int getCurrentHealth() {
        return this.currentHealth;
    }

    public String getName() {
        return this.name;
    }

     // Konstruktor Player, inisialisasi atribut dasar
    public Player(String name) {
        this.name = name;
        this.baseHealth = 100;
        this.baseAttack = 10;
        this.level = 1;
        this.incrementHealth = 100;
        this.incrementAttack = 10;
        this.currentHealth = baseHealth;
    }

    // Menampilkan status lengkap pemain
    public void display() {
        System.out.println("Player\t\t: " + this.name);
        System.out.println("Level\t\t: " + this.level);
        System.out.println("Health\t\t: " + this.currentHealth + " / " + this.MaxHealth());
        System.out.println("Attack Power\t: " + this.getAttackPower());
        if (armor != null) {
            System.out.println("Armor\t\t: " + armor.getName() + " | Strength: " + armor.getStrength());
        }
        if (weapon != null) {
            System.out.println("Weapon\t\t: " + weapon.getName() + " | Power: " + weapon.getAttack());
        }
        System.out.println();
    }

    private void levelUp() {
        this.level++;
        this.baseHealth += this.incrementHealth;
        this.currentHealth = MaxHealth();
        System.out.println(this.name + " leveled up to level " + this.level + "!");
    }

    public void setArmor(Armor armor) {
        this.armor = armor;
        this.currentHealth = MaxHealth();
    }

    public void setWeapon(Weapon weapon) {
        this.weapon = weapon;
    }

    public int MaxHealth() {
        return this.baseHealth + (this.armor != null ? this.armor.getAddHealth() : 0);
    }

    private int getAttackPower() {
        return this.baseAttack + this.level * this.incrementAttack + (this.weapon != null ? this.weapon.getAttack() : 0);
    }

    // Melakukan serangan ke pemain lawan
    public void attack(Player opponent) {
        System.out.println(this.name + " is attacking " + opponent.name + "...");
        int attackPower = this.getAttackPower();
        int armorStrength = (opponent.armor != null) ? opponent.armor.getStrength() : 0;
        int damage = attackPower - (armorStrength * 2);

        if (damage < 1) damage = 1;

        opponent.currentHealth -= damage;
        System.out.println(this.name + " deals " + damage + " damage to " + opponent.name + " (Armor Strength: " + armorStrength + ")");
        if (opponent.currentHealth <= 0) {
            opponent.currentHealth = 0;
            System.out.println(opponent.name + " has been defeated!");
            this.levelUp();
        }
    }

    public void defend() {
        System.out.println(this.name + " is defending this turn. No damage dealt.");
    }

    public void resetHealthAfterBattle() {
        this.currentHealth = MaxHealth();
    }
}


// Kelas Weapon merepresentasikan senjata yang bisa digunakan pemain
class Weapon {
    private String name;
    private int attack;

    public Weapon(String name, int attack) {
        this.name = name;
        this.attack = attack;
    }

    public int getAttack() {
        return this.attack;
    }

    public String getName() {
        return this.name;
    }
}

// Kelas Armor merepresentasikan armor yang bisa digunakan pemain
class Armor {
    private String name;
    private int strength;
    private int health;

    public Armor(String name, int strength, int health) {
        this.name = name;
        this.strength = strength;
        this.health = health;
    }

    public int getAddHealth() {
        return this.strength * 10 + this.health;
    }

    public int getStrength() {
        return this.strength;
    }

    public String getName() {
        return this.name;
    }
}

public class Main {
    public static void main(String[] args) {
        Player player1 = new Player("Budi");
        Armor armor1 = new Armor("Iron Armor", 60, 40);
        Weapon weapon1 = new Weapon("Iron Sword", 100);
        player1.setArmor(armor1);
        player1.setWeapon(weapon1);

        Player player2 = new Player("Tono");
        Armor armor2 = new Armor("Leather Armor", 5, 200);
        Weapon weapon2 = new Weapon("Rusty Sword", 45);
        player2.setArmor(armor2);
        player2.setWeapon(weapon2);

        player1.display();
        player2.display();

        System.out.println("===== BATTLE START =====");

        Random rand = new Random();
         // Simulasi pertarungan hingga salah satu pemain kalah
        while (player1.getCurrentHealth() > 0 && player2.getCurrentHealth() > 0) {
            // Simulasi tindakan acak (attack atau defend)
            if (rand.nextBoolean()) {
                player1.attack(player2);
            } else {
                player1.defend();
            }

              // Jika player2 sudah kalah, keluar dari loop
            if (player2.getCurrentHealth() <= 0) break;

             // Simulasi tindakan acak (attack atau defend) untuk player2
            if (rand.nextBoolean()) {
                player2.attack(player1);
            } else {
                player2.defend();
            }

            System.out.println();
        }

        System.out.println("===== BATTLE ENDED =====\n");

        // Reset HP setelah battle
        player1.resetHealthAfterBattle();
        player2.resetHealthAfterBattle();

        // Menampilkan status akhir kedua pemain
        player1.display();
        player2.display();
    }
}