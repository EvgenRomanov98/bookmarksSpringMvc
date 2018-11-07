package com.bookmarks.dao.model;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
@TableGenerator(name="tab", initialValue=0, allocationSize=50)
public class Menu {
    @Id
//    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @GeneratedValue(strategy=GenerationType.TABLE, generator="tab")
    private Long id;
    @Column
    private String nameMenu;
    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<Bookmark> listBookmarks;

    @ManyToOne
    @JoinColumn(referencedColumnName = "id")
    private UserInfo userInfo;
}
