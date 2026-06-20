package dto;

public class Board {

    private int num;
    private String title;
    private String writer;
    private String content;

    public Board() {}

    public Board(int num, String title, String writer, String content) {
        this.num = num;
        this.title = title;
        this.writer = writer;
        this.content = content;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}