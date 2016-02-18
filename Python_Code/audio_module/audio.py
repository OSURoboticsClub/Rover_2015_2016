#audio file player that can be imported, import file can choose from a list what audio file to play
#music choices (can be added to)
#1. Star wars theme
#2. Claire De Lune


#allows us to use audio files of our choice and load it into the program

import pyglet

pyglet.options['audio'] = ('openal', 'silent')  #chooses the driver for audio, if the audio driver is not selected it will not play anything
                                                #mac uses open al, but ubuntu can get this using their package manager, or switch to Pulse which is built in

audio = ['starwars.wav','clairedelune.wav'] #string list of audio files names

def exit_callback(dt):  #function that will be called to close program
    pyglet.app.exit()


def song(x):   #main function that can be used to call different songs to play
    path = '/whatever/linux_directory/there_is/pythonstuff/music/' + audio[x]   #this path must be changed 
    sound = pyglet.media.load(path, streaming=False)    #loads song into variable with the correct path 
    sound.play()
    pyglet.clock.schedule_once(exit_callback , sound.duration) #will enact exit_callback when the sound is over    
    pyglet.app.run() #runs song

#Will create ROS Node for this 



