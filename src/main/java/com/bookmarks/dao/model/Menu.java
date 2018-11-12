package com.bookmarks.dao.model;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
public class Menu {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Long id;
    @Column
    private String nameMenu;
    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<Bookmark> listBookmarks;

    @ManyToOne
    @JoinColumn(referencedColumnName = "id")
    private UserInfo userInfo;
}
