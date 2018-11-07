package com.bookmarks.dao.model;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@TableGenerator(name="tab", initialValue=0, allocationSize=50)
public class Bookmark {

    @Id
    @GeneratedValue(strategy=GenerationType.TABLE, generator="tab")
    private Long id;
    @Column
    private String link;
    @Column
    private String comment;
    @ManyToOne
    private Menu menu;

    @ManyToOne
    private UserInfo userInfo;
}
