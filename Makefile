CSRCS=main.cpp

CFLAGS =  -c -O3 -DNDEBUG -fPIC

INCLUDE = -I. -I/usr/include/ -I/usr/include/X11/ -I/usr/local/include/GL -L~/Programowanie/OSG/OpenSceneGraph-Data-3.0.0 -L/home/heroadm/Programowanie/MasterThesis

INCOSG = -I $(HOME)/Programowanie/OSG/OpenSceneGraph/include
LDLIBS = -lm -ldl -lGL -lGLU -lpthread -lXext -lX11

LDFLAGS =  -L. -L/usr/lib -L/usr/X11R6/lib -L/usr/local/lib -L/home/heroadm/Programowanie/OSG/OpeneSceneGraph/lib
LDOSG = -L $(HOME)/Programowanie/OSG/OpenSceneGraph/lib -losg -losgViewer -losgSim -losgUtil -losgGA -losgDB -losgAnimation
COBJS=$(patsubst %.cpp,%.o,$(CSRCS))

CC = g++

EXE=Thesis

all: $(EXE)

$(EXE): $(COBJS) 
	g++ -o$(EXE) $(COBJS) $(INCLUDE) $(INCOSG) $(LDFLAGS) $(LDLIBS) $(LDOSG)


$(COBJS): %.o : %.cpp 
	$(CC) $(CFLAGS) -o $@ $< 

