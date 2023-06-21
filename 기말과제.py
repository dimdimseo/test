import turtle
import random

# 게임 화면 설정
wn = turtle.Screen()
wn.bgcolor("black")
wn.title("Pacman Game")
wn.setup(width=800, height=600)
wn.tracer(0)

# 이미지 등록
wn.register_shape("wizard.gif")
wn.register_shape("goblin.gif")
wn.register_shape("ball.gif")
wn.register_shape("cherry.gif")
wn.register_shape("x.gif")
wn.register_shape("pacman.gif")

# 팩맨 클래스
class Pacman(turtle.Turtle):
    def __init__(self):
        super().__init__(shape="pacman.gif")
        self.penup()
        self.speed(0)
        self.direction = "stop"

    def move(self):
        if self.direction == "up":
            self.setheading(90)
            self.forward(2)
        elif self.direction == "down":
            self.setheading(270)
            self.forward(2)
        elif self.direction == "left":
            self.setheading(180)
            self.forward(2)
        elif self.direction == "right":
            self.setheading(0)
            self.forward(2)

    def move_up(self):
        self.direction = "up"

    def move_down(self):
        self.direction = "down"

    def move_left(self):
        self.direction = "left"

    def move_right(self):
        self.direction = "right"

    # 화면 범위 제한
        if self.xcor() > 380:
            self.setx(380)
            self.direction = "stop"
        elif self.xcor() < -380:
            self.setx(-380)
            self.direction = "stop"
        if self.ycor() > 280:
            self.sety(280)
            self.direction = "stop"
        elif self.ycor() < -280:
            self.sety(-280)
            self.direction = "stop"

# 애들 클래스
class Sprite(turtle.Turtle):
    def __init__(self, shape):
        super().__init__(shape)
        self.penup()
        self.speed(0)
        self.goto(random.randint(-380, 380), random.randint(-280, 280))
        self.direction = random.choice(["up", "down", "left", "right"])

    def move(self):
        if self.direction == "up":
            self.setheading(90)
            self.forward(1)
        elif self.direction == "down":
            self.setheading(270)
            self.forward(1)
        elif self.direction == "left":
            self.setheading(180)
            self.forward(1)
        elif self.direction == "right":
            self.setheading(0)
            self.forward(1)

        # 경계 체크
        if self.xcor() > 400 or self.xcor() < -400 or self.ycor() > 300 or self.ycor() < -300:
            self.direction = random.choice(["up", "down", "left", "right"])

# 충돌 체크 함수
def check_collision(pacman, sprite):
    if pacman.distance(sprite) < 20:
        sprite.shape("x.gif")

# 키보드 이벤트 처리 함수
def move_up():
    pacman.move_up()

def move_down():
    pacman.move_down()

def move_left():
    pacman.move_left()

def move_right():
    pacman.move_right()

# 키보드 이벤트 등록
wn.listen()
wn.onkeypress(move_up, "Up")
wn.onkeypress(move_down, "Down")
wn.onkeypress(move_left, "Left")
wn.onkeypress(move_right, "Right")

# 팩맨과 애들 생성
pacman = Pacman()
sprites = []
for _ in range(5):
    sprite = Sprite(shape="goblin.gif")
    sprites.append(sprite)
for _ in range(5):
    sprite = Sprite(shape="ball.gif")
    sprites.append(sprite)
for _ in range(5):
    sprite = Sprite(shape="cherry.gif")
    sprites.append(sprite)
for _ in range(5):
    sprite = Sprite(shape="wizard.gif")
    sprites.append(sprite)

# 게임 루프
while True:
    wn.update()

    pacman.move()

    for sprite in sprites:
        sprite.move()
        check_collision(pacman, sprite)
