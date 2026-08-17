### how to perform build system adding
TODO. in progress

### how to perfrom try / catch
try and catch can't be performed together. typically when you perform a `try`, you also perform a `defer`.

### how to perform a blinky test on
TODO

### are there simulators to work on
TODO

### what is init from main in Zig?
TODO

### what is an allocator in Zig?
allocators allocate memory to be used within the programming language in entire pages

[allocators](https://zig.guide/standard-library/allocators/)

### how to run a test case
if using vscode (recommended) right click on a test and click on 'run test at cursor'

```zig
test "<right click here>" {
    std.debug.print("TODO: a test")
}
```

### how to establish electrical capacity of a microcontroller
TODO

### is there a UI framework
[webui](https://webui.me/docs.html#/zig?id=run)

### what is the commercialization argument for zig?
Replacement to C, C++ or Rust

### what's a baud rate?
Baud rate measures how many signal changes (symbols) occur per second in a communication channel, expressed in symbols per second (Bd). In simple systems using two symbols (like 0 and 1), baud rate equals bits per second.

### where to go to learn about microcontroller work?
[Zig Embedded Group](https://github.com/ZigEmbeddedGroup)

### what is a serial port
A serial port is a communication interface that transfers data sequentially, one bit at a time. It is commonly used to connect devices like modems and peripherals to computers, although modern systems have largely replaced it with USB ports.

### how to speak to a usb device from a zig program?
[Serial](https://github.com/ZigEmbeddedGroup/serial)

### what is a microcontroller to use with telecommunications?
AM335x from texas instruments

