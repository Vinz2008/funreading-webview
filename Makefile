ifeq ($(OS),Windows_NT)
	CPPFLAGS="-mwindows -L./dll/x64 -lwebview -lWebView2Loader"
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		CPPFLAGS=`pkg-config --cflags --libs gtk+-3.0 webkit2gtk-4.0` -lstdc++
	endif
	ifeq ($(UNAME_S),Darwin)
		CPPFLAGS="-std=c++11 -framework WebKit"
	endif
endif

CC=gcc
GPP=g++

all:
	$(GPP) -c webview.cc $(CPPFLAGS) -o webview.o
	$(CC) -c main.c -o main.o
	$(GPP) main.o webview.o $(CPPFLAGS) -o funreading

windows:
	$(GPP) -c webview.cc $(CPPFLAGS) -o webview.o
	$(CC) -c main.c -o main.o
	$(GPP) main.o webview.o $(CPPFLAGS) -o funreading.exe

clean:
	rm -rf *.o funreading funreading.exe