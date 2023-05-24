package com.daw1.ong01;

public class Request {
    private int id;
    private int skill;
    private String user;
    private String description;
    private String date;
    private boolean accepted;
    private String contributor;

    public Request(int id, int skill, String user, String description, String date, boolean accepted, String contributor) {
        this.id = id;
        this.skill = skill;
        this.user = user;
        this.description = description;
        this.date = date;
        this.accepted = accepted;
        this.contributor = contributor;
    }

    public int getId() {
        return id;
    }

    public int getSkill() {
        return skill;
    }

    public String getUser() {
        return user;
    }

    public String getDescription() {
        return description;
    }

    public String getDate() {
        return date;
    }

    public boolean isAccepted() {
        return accepted;
    }

    public String getContributor() {
        return contributor;
    }
}
