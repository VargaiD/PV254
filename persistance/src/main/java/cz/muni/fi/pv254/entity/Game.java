package cz.muni.fi.pv254.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

/**
 *
 * @author Šimon Baláž
 */
public class Game {
    
    @Id
    private Long id;
    
    @NotNull
    @Column(nullable = false)
    private String name;
    
    public Game(Long id, String name) {
        this.id = id;
        this.name = name;
    }
    
    public Game() {}
    
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || !(o instanceof Game)) return false;

        Game game = (Game) o;

        return name == game.name;
    }
    
    @Override
    public int hashCode() {
        int result = 0;
        result = 31 * result + (name != null ? name.hashCode() : 0);       
        return result;
    }
}