#------------------------------------------------------------------------------#
# This makefile was generated by 'cbp2make' tool rev.147                       #
#------------------------------------------------------------------------------#


WORKDIR = `pwd`

CC = gcc
CXX = g++
AR = ar
LD = g++
WINDRES = windres

INC = 
CFLAGS = -fno-strict-aliasing -Wno-unused-local-typedefs -DwxUSE_UNICODE
RESINC = 
LIBDIR = 
LIB = 
LDFLAGS = 

INC_LINUX_DEBUG = $(INC) -Iinclude -I../xFade -I../include
CFLAGS_LINUX_DEBUG =  -Wall -g -std=gnu++14 `wx-config --version=3.1 --cflags` `pkg-config --cflags gstreamer-1.0 gstreamer-video-1.0` -Winvalid-pch -DWX_PRECOMP -DLINUX -D__WXDEBUG__ -D__cdecl=""
RESINC_LINUX_DEBUG = $(RESINC)
RCFLAGS_LINUX_DEBUG = $(RCFLAGS)
LIBDIR_LINUX_DEBUG = $(LIBDIR)
LIB_LINUX_DEBUG = $(LIB)
LDFLAGS_LINUX_DEBUG =  -lGL -lGLU -lglut -ldl -lX11 `pkg-config --libs log4cpp` `wx-config --version=3.1 --libs std,media,gl,aui,propgrid` `pkg-config --libs gstreamer-1.0 gstreamer-video-1.0` -lexpat -lporttime -lportmidi -rdynamic $(LDFLAGS)
OBJDIR_LINUX_DEBUG = .objs_debug
DEP_LINUX_DEBUG = 
OUT_LINUX_DEBUG = ../bin/xFade

INC_LINUX_RELEASE = $(INC) -Iinclude -I../xFade -I../include
CFLAGS_LINUX_RELEASE = $(CFLAGS) -O2 -std=gnu++14 -Wall `wx-config --version=3.1 --cflags` `pkg-config --cflags gstreamer-1.0 gstreamer-video-1.0` -Winvalid-pch -DWX_PRECOMP -DLINUX -DNDEBUG -D__cdecl='' -Wno-reorder -Wno-sign-compare -Wno-unused-variable -Wno-unused-but-set-variable -Wno-unused-function -Wno-unknown-pragmas
RESINC_LINUX_RELEASE = $(RESINC)
RCFLAGS_LINUX_RELEASE = $(RCFLAGS) -Wno-reorder -Wno-sign-compare -Wno-unused-variable -Wno-unused-but-set-variable -Wno-unused-function -Wno-unknown-pragmas
LIBDIR_LINUX_RELEASE = $(LIBDIR)
LIB_LINUX_RELEASE = $(LIB)
LDFLAGS_LINUX_RELEASE =  -lGL -lGLU -lglut -ldl -lX11 `pkg-config --libs log4cpp` `wx-config --version=3.1 --libs std,media,gl,aui,propgrid` `pkg-config --libs gstreamer-1.0 gstreamer-video-1.0` -lexpat -lporttime -lportmidi -rdynamic $(LDFLAGS)
OBJDIR_LINUX_RELEASE = .objs_lr
DEP_LINUX_RELEASE = 
OUT_LINUX_RELEASE = ../bin/xFade

OBJ_LINUX_DEBUG = $(OBJDIR_LINUX_DEBUG)/Settings.o $(OBJDIR_LINUX_DEBUG)/SettingsDialog.o $(OBJDIR_LINUX_DEBUG)/UniverseEntryDialog.o $(OBJDIR_LINUX_DEBUG)/wxLED.o $(OBJDIR_LINUX_DEBUG)/xFadeApp.o $(OBJDIR_LINUX_DEBUG)/xFadeMain.o $(OBJDIR_LINUX_DEBUG)/__/xLights/IPEntryDialog.o $(OBJDIR_LINUX_DEBUG)/MIDIListener.o $(OBJDIR_LINUX_DEBUG)/MIDIAssociateDialog.o $(OBJDIR_LINUX_DEBUG)/Emitter.o $(OBJDIR_LINUX_DEBUG)/__/xSchedule/wxMIDI/src/wxMidiDatabase.o $(OBJDIR_LINUX_DEBUG)/__/xSchedule/wxMIDI/src/wxMidi.o $(OBJDIR_LINUX_DEBUG)/__/xLights/xLightsVersion.o $(OBJDIR_LINUX_DEBUG)/__/xLights/xLightsTimer.o $(OBJDIR_LINUX_DEBUG)/__/xLights/UtilFunctions.o

OBJ_LINUX_RELEASE = $(OBJDIR_LINUX_RELEASE)/Settings.o $(OBJDIR_LINUX_RELEASE)/SettingsDialog.o $(OBJDIR_LINUX_RELEASE)/UniverseEntryDialog.o $(OBJDIR_LINUX_RELEASE)/wxLED.o $(OBJDIR_LINUX_RELEASE)/xFadeApp.o $(OBJDIR_LINUX_RELEASE)/xFadeMain.o $(OBJDIR_LINUX_RELEASE)/__/xLights/IPEntryDialog.o $(OBJDIR_LINUX_RELEASE)/MIDIListener.o $(OBJDIR_LINUX_RELEASE)/MIDIAssociateDialog.o $(OBJDIR_LINUX_RELEASE)/Emitter.o $(OBJDIR_LINUX_RELEASE)/__/xSchedule/wxMIDI/src/wxMidiDatabase.o $(OBJDIR_LINUX_RELEASE)/__/xSchedule/wxMIDI/src/wxMidi.o $(OBJDIR_LINUX_RELEASE)/__/xLights/xLightsVersion.o $(OBJDIR_LINUX_RELEASE)/__/xLights/xLightsTimer.o $(OBJDIR_LINUX_RELEASE)/__/xLights/UtilFunctions.o

all: linux_debug linux_release

clean: clean_linux_debug clean_linux_release

before_linux_debug: 
	@test -d ../bin || mkdir -p ../bin
	@test -d $(OBJDIR_LINUX_DEBUG) || mkdir -p $(OBJDIR_LINUX_DEBUG)
	@test -d $(OBJDIR_LINUX_DEBUG)/__/xLights || mkdir -p $(OBJDIR_LINUX_DEBUG)/__/xLights
	@test -d $(OBJDIR_LINUX_DEBUG)/__/xSchedule/wxMIDI/src || mkdir -p $(OBJDIR_LINUX_DEBUG)/__/xSchedule/wxMIDI/src

after_linux_debug: 

linux_debug: before_linux_debug out_linux_debug after_linux_debug

out_linux_debug: before_linux_debug $(OBJ_LINUX_DEBUG) $(DEP_LINUX_DEBUG)
	$(LD) $(LIBDIR_LINUX_DEBUG) -o $(OUT_LINUX_DEBUG) $(OBJ_LINUX_DEBUG)  $(LDFLAGS_LINUX_DEBUG) $(LIB_LINUX_DEBUG)

$(OBJDIR_LINUX_DEBUG)/Settings.o: Settings.cpp
	$(CXX) $(CFLAGS_LINUX_DEBUG) $(INC_LINUX_DEBUG) -c Settings.cpp -o $(OBJDIR_LINUX_DEBUG)/Settings.o

$(OBJDIR_LINUX_DEBUG)/SettingsDialog.o: SettingsDialog.cpp
	$(CXX) $(CFLAGS_LINUX_DEBUG) $(INC_LINUX_DEBUG) -c SettingsDialog.cpp -o $(OBJDIR_LINUX_DEBUG)/SettingsDialog.o

$(OBJDIR_LINUX_DEBUG)/UniverseEntryDialog.o: UniverseEntryDialog.cpp
	$(CXX) $(CFLAGS_LINUX_DEBUG) $(INC_LINUX_DEBUG) -c UniverseEntryDialog.cpp -o $(OBJDIR_LINUX_DEBUG)/UniverseEntryDialog.o

$(OBJDIR_LINUX_DEBUG)/wxLED.o: wxLED.cpp
	$(CXX) $(CFLAGS_LINUX_DEBUG) $(INC_LINUX_DEBUG) -c wxLED.cpp -o $(OBJDIR_LINUX_DEBUG)/wxLED.o

$(OBJDIR_LINUX_DEBUG)/xFadeApp.o: xFadeApp.cpp
	$(CXX) $(CFLAGS_LINUX_DEBUG) $(INC_LINUX_DEBUG) -c xFadeApp.cpp -o $(OBJDIR_LINUX_DEBUG)/xFadeApp.o

$(OBJDIR_LINUX_DEBUG)/xFadeMain.o: xFadeMain.cpp
	$(CXX) $(CFLAGS_LINUX_DEBUG) $(INC_LINUX_DEBUG) -c xFadeMain.cpp -o $(OBJDIR_LINUX_DEBUG)/xFadeMain.o

$(OBJDIR_LINUX_DEBUG)/__/xLights/IPEntryDialog.o: ../xLights/IPEntryDialog.cpp
	$(CXX) $(CFLAGS_LINUX_DEBUG) $(INC_LINUX_DEBUG) -c ../xLights/IPEntryDialog.cpp -o $(OBJDIR_LINUX_DEBUG)/__/xLights/IPEntryDialog.o

$(OBJDIR_LINUX_DEBUG)/MIDIListener.o: MIDIListener.cpp
	$(CXX) $(CFLAGS_LINUX_DEBUG) $(INC_LINUX_DEBUG) -c MIDIListener.cpp -o $(OBJDIR_LINUX_DEBUG)/MIDIListener.o

$(OBJDIR_LINUX_DEBUG)/MIDIAssociateDialog.o: MIDIAssociateDialog.cpp
	$(CXX) $(CFLAGS_LINUX_DEBUG) $(INC_LINUX_DEBUG) -c MIDIAssociateDialog.cpp -o $(OBJDIR_LINUX_DEBUG)/MIDIAssociateDialog.o

$(OBJDIR_LINUX_DEBUG)/Emitter.o: Emitter.cpp
	$(CXX) $(CFLAGS_LINUX_DEBUG) $(INC_LINUX_DEBUG) -c Emitter.cpp -o $(OBJDIR_LINUX_DEBUG)/Emitter.o

$(OBJDIR_LINUX_DEBUG)/__/xSchedule/wxMIDI/src/wxMidiDatabase.o: ../xSchedule/wxMIDI/src/wxMidiDatabase.cpp
	$(CXX) $(CFLAGS_LINUX_DEBUG) $(INC_LINUX_DEBUG) -c ../xSchedule/wxMIDI/src/wxMidiDatabase.cpp -o $(OBJDIR_LINUX_DEBUG)/__/xSchedule/wxMIDI/src/wxMidiDatabase.o

$(OBJDIR_LINUX_DEBUG)/__/xSchedule/wxMIDI/src/wxMidi.o: ../xSchedule/wxMIDI/src/wxMidi.cpp
	$(CXX) $(CFLAGS_LINUX_DEBUG) $(INC_LINUX_DEBUG) -c ../xSchedule/wxMIDI/src/wxMidi.cpp -o $(OBJDIR_LINUX_DEBUG)/__/xSchedule/wxMIDI/src/wxMidi.o

$(OBJDIR_LINUX_DEBUG)/__/xLights/xLightsVersion.o: ../xLights/xLightsVersion.cpp
	$(CXX) $(CFLAGS_LINUX_DEBUG) $(INC_LINUX_DEBUG) -c ../xLights/xLightsVersion.cpp -o $(OBJDIR_LINUX_DEBUG)/__/xLights/xLightsVersion.o

$(OBJDIR_LINUX_DEBUG)/__/xLights/xLightsTimer.o: ../xLights/xLightsTimer.cpp
	$(CXX) $(CFLAGS_LINUX_DEBUG) $(INC_LINUX_DEBUG) -c ../xLights/xLightsTimer.cpp -o $(OBJDIR_LINUX_DEBUG)/__/xLights/xLightsTimer.o

$(OBJDIR_LINUX_DEBUG)/__/xLights/UtilFunctions.o: ../xLights/UtilFunctions.cpp
	$(CXX) $(CFLAGS_LINUX_DEBUG) $(INC_LINUX_DEBUG) -c ../xLights/UtilFunctions.cpp -o $(OBJDIR_LINUX_DEBUG)/__/xLights/UtilFunctions.o

clean_linux_debug: 
	rm -f $(OBJ_LINUX_DEBUG) $(OUT_LINUX_DEBUG)

before_linux_release: 
	@test -d ../bin || mkdir -p ../bin
	@test -d $(OBJDIR_LINUX_RELEASE) || mkdir -p $(OBJDIR_LINUX_RELEASE)
	@test -d $(OBJDIR_LINUX_RELEASE)/__/xLights || mkdir -p $(OBJDIR_LINUX_RELEASE)/__/xLights
	@test -d $(OBJDIR_LINUX_RELEASE)/__/xSchedule/wxMIDI/src || mkdir -p $(OBJDIR_LINUX_RELEASE)/__/xSchedule/wxMIDI/src

after_linux_release: 

linux_release: before_linux_release out_linux_release after_linux_release

out_linux_release: before_linux_release $(OBJ_LINUX_RELEASE) $(DEP_LINUX_RELEASE)
	$(LD) $(LIBDIR_LINUX_RELEASE) -o $(OUT_LINUX_RELEASE) $(OBJ_LINUX_RELEASE)  $(LDFLAGS_LINUX_RELEASE) $(LIB_LINUX_RELEASE)

$(OBJDIR_LINUX_RELEASE)/Settings.o: Settings.cpp
	$(CXX) $(CFLAGS_LINUX_RELEASE) $(INC_LINUX_RELEASE) -c Settings.cpp -o $(OBJDIR_LINUX_RELEASE)/Settings.o

$(OBJDIR_LINUX_RELEASE)/SettingsDialog.o: SettingsDialog.cpp
	$(CXX) $(CFLAGS_LINUX_RELEASE) $(INC_LINUX_RELEASE) -c SettingsDialog.cpp -o $(OBJDIR_LINUX_RELEASE)/SettingsDialog.o

$(OBJDIR_LINUX_RELEASE)/UniverseEntryDialog.o: UniverseEntryDialog.cpp
	$(CXX) $(CFLAGS_LINUX_RELEASE) $(INC_LINUX_RELEASE) -c UniverseEntryDialog.cpp -o $(OBJDIR_LINUX_RELEASE)/UniverseEntryDialog.o

$(OBJDIR_LINUX_RELEASE)/wxLED.o: wxLED.cpp
	$(CXX) $(CFLAGS_LINUX_RELEASE) $(INC_LINUX_RELEASE) -c wxLED.cpp -o $(OBJDIR_LINUX_RELEASE)/wxLED.o

$(OBJDIR_LINUX_RELEASE)/xFadeApp.o: xFadeApp.cpp
	$(CXX) $(CFLAGS_LINUX_RELEASE) $(INC_LINUX_RELEASE) -c xFadeApp.cpp -o $(OBJDIR_LINUX_RELEASE)/xFadeApp.o

$(OBJDIR_LINUX_RELEASE)/xFadeMain.o: xFadeMain.cpp
	$(CXX) $(CFLAGS_LINUX_RELEASE) $(INC_LINUX_RELEASE) -c xFadeMain.cpp -o $(OBJDIR_LINUX_RELEASE)/xFadeMain.o

$(OBJDIR_LINUX_RELEASE)/__/xLights/IPEntryDialog.o: ../xLights/IPEntryDialog.cpp
	$(CXX) $(CFLAGS_LINUX_RELEASE) $(INC_LINUX_RELEASE) -c ../xLights/IPEntryDialog.cpp -o $(OBJDIR_LINUX_RELEASE)/__/xLights/IPEntryDialog.o

$(OBJDIR_LINUX_RELEASE)/MIDIListener.o: MIDIListener.cpp
	$(CXX) $(CFLAGS_LINUX_RELEASE) $(INC_LINUX_RELEASE) -c MIDIListener.cpp -o $(OBJDIR_LINUX_RELEASE)/MIDIListener.o

$(OBJDIR_LINUX_RELEASE)/MIDIAssociateDialog.o: MIDIAssociateDialog.cpp
	$(CXX) $(CFLAGS_LINUX_RELEASE) $(INC_LINUX_RELEASE) -c MIDIAssociateDialog.cpp -o $(OBJDIR_LINUX_RELEASE)/MIDIAssociateDialog.o

$(OBJDIR_LINUX_RELEASE)/Emitter.o: Emitter.cpp
	$(CXX) $(CFLAGS_LINUX_RELEASE) $(INC_LINUX_RELEASE) -c Emitter.cpp -o $(OBJDIR_LINUX_RELEASE)/Emitter.o

$(OBJDIR_LINUX_RELEASE)/__/xSchedule/wxMIDI/src/wxMidiDatabase.o: ../xSchedule/wxMIDI/src/wxMidiDatabase.cpp
	$(CXX) $(CFLAGS_LINUX_RELEASE) $(INC_LINUX_RELEASE) -c ../xSchedule/wxMIDI/src/wxMidiDatabase.cpp -o $(OBJDIR_LINUX_RELEASE)/__/xSchedule/wxMIDI/src/wxMidiDatabase.o

$(OBJDIR_LINUX_RELEASE)/__/xSchedule/wxMIDI/src/wxMidi.o: ../xSchedule/wxMIDI/src/wxMidi.cpp
	$(CXX) $(CFLAGS_LINUX_RELEASE) $(INC_LINUX_RELEASE) -c ../xSchedule/wxMIDI/src/wxMidi.cpp -o $(OBJDIR_LINUX_RELEASE)/__/xSchedule/wxMIDI/src/wxMidi.o

$(OBJDIR_LINUX_RELEASE)/__/xLights/xLightsVersion.o: ../xLights/xLightsVersion.cpp
	$(CXX) $(CFLAGS_LINUX_RELEASE) $(INC_LINUX_RELEASE) -c ../xLights/xLightsVersion.cpp -o $(OBJDIR_LINUX_RELEASE)/__/xLights/xLightsVersion.o

$(OBJDIR_LINUX_RELEASE)/__/xLights/xLightsTimer.o: ../xLights/xLightsTimer.cpp
	$(CXX) $(CFLAGS_LINUX_RELEASE) $(INC_LINUX_RELEASE) -c ../xLights/xLightsTimer.cpp -o $(OBJDIR_LINUX_RELEASE)/__/xLights/xLightsTimer.o

$(OBJDIR_LINUX_RELEASE)/__/xLights/UtilFunctions.o: ../xLights/UtilFunctions.cpp
	$(CXX) $(CFLAGS_LINUX_RELEASE) $(INC_LINUX_RELEASE) -c ../xLights/UtilFunctions.cpp -o $(OBJDIR_LINUX_RELEASE)/__/xLights/UtilFunctions.o

clean_linux_release: 
	rm -f $(OBJ_LINUX_RELEASE) $(OUT_LINUX_RELEASE)

Settings.cpp: Settings.h

SettingsDialog.cpp: SettingsDialog.h Settings.h UniverseEntryDialog.h

UniverseEntryDialog.cpp: UniverseEntryDialog.h

wxLED.cpp: wxLED.h

xFadeApp.cpp: xFadeApp.h xFadeMain.h

xFadeMain.h: Settings.h PacketData.h wxLED.h

xFadeMain.cpp: xFadeMain.h UniverseEntryDialog.h Emitter.h MIDIListener.h SettingsDialog.h MIDIAssociateDialog.h ../include/xLights.xpm ../include/xLights-16.xpm ../include/xLights-32.xpm ../include/xLights-64.xpm ../include/xLights-128.xpm

Emitter.h: PacketData.h

MIDIListener.cpp: MIDIListener.h

MIDIAssociateDialog.cpp: MIDIAssociateDialog.h MIDIListener.h

Emitter.cpp: Emitter.h xFadeMain.h

.PHONY: before_linux_debug after_linux_debug clean_linux_debug before_linux_release after_linux_release clean_linux_release

