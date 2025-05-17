from pypresence import Presence
import time

client_id = '1364268001972715550'

RPC = Presence(client_id)
RPC.connect()

RPC.update(
    # state="Playing Melee",
    large_image="dolphin",
    large_text="Slippi Dolphin",
    details="Getting Wrecked",
    buttons=[{"label": "Get Slippi", "url": "https://slippi.gg/"}]
)


while True:
    time.sleep(60)
