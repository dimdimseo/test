
package dto;

public class Review {

    private int boardNum;
    private String writer;
    private int rating;
    private String content;

    public Review() {}

    public Review(int boardNum,
                  String writer,
                  int rating,
                  String content) {

        this.boardNum = boardNum;
        this.writer = writer;
        this.rating = rating;
        this.content = content;
    }

    public int getBoardNum() {
        return boardNum;
    }

    public void setBoardNum(int boardNum) {
        this.boardNum = boardNum;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}