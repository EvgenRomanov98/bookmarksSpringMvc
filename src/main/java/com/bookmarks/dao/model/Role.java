package com.bookmarks.dao.model;



import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Set;

@Data
@EqualsAndHashCode(exclude = "userInfo")
@Entity
@Table(name = "role")
@TableGenerator(name="tab", initialValue=0, allocationSize=50)
public class Role {
    @Id
    @GeneratedValue(strategy=GenerationType.TABLE, generator="tab")
    private Long id;
    private String name;
   
    @ManyToMany(mappedBy = "roles")
    private Set<UserInfo> userInfo;

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
