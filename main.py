from module1 import MyMod1, MyMod2, MyMod3, MyMod4


def hello(name: str, numb: int):
    """adwawdawdaawdawdw"""

    print(
        f"Hello, {name}. Your age is {numb}. lorem ipsum ipsum lorem и еще какой-то длинный текст, который должен будет отформатить руф. adawdawdawdawddwddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd"
    )


print("he")
dct = {
    "hello": "world",
}


class MyCls1(MyMod1):
    """
    awdawdawd
    """

    def __init__(self):
        pass


hello(name="Danya", numb=30)


mod3 = MyMod3()
mod1 = MyMod1()
mod2 = MyMod2()
mod4 = MyMod4()
mod3.name = "huy"
mod3.state = 123

mod3.method222()
hello(name=mod3.name, numb=mod3.state)
mod3.method222()

if True:
    if True:
        if True:
            if True:
                if True:
                    pass
