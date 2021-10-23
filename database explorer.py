import os
import pickle
from os import system

if os.name == "nt":
    system("cls")
else:
    system("clear")
print("""

        _      _    _                        _                     
       (_)    | |  | |                      | |                    
  _ __  _  ___| | _| | ___    _____  ___ __ | | ___  _ __ ___ _ __ 
 | '_ \| |/ __| |/ / |/ _ \  / _ \ \/ / '_ \| |/ _ \| '__/ _ \ '__|
 | |_) | | (__|   <| |  __/ |  __/>  <| |_) | | (_) | | |  __/ |   
 | .__/|_|\___|_|\_\_|\___|  \___/_/\_\ .__/|_|\___/|_|  \___|_|   
 | |                                  | |                          
 |_|                                  |_|                          

""")

data_filename = input("? Pickle file path: ")
if os.path.isfile(data_filename):
    pass
else:
    print("! This file does not exist")
    raise SystemExit

class Data:
    def __init__(self, wallet, bank, xp, level):
        self.wallet = wallet
        self.bank = bank
        self.xp = xp
        self.level = level

def load_data():
    if os.path.isfile(data_filename):
        with open(data_filename, "rb") as file:
            return pickle.load(file)
    else:
        return

def load_member_data(member_ID):
    data = load_data()

    if member_ID not in data:
        return Data(0, 0, 0, 0)

    return data[member_ID]

def save_member_data(member_ID, member_data):
    data = load_data()

    data[member_ID] = member_data

    with open(data_filename, "wb") as file:
        pickle.dump(data, file)

userid = int(input("? Enter user id:"))
dat = load_member_data(userid)
print(f"- Data entries:\n    1. Wallet: {dat.wallet}\n    2. Bank: {dat.bank}\n    3. Exp: {dat.xp}\n    4. Level: {dat.level}")
c = input("? Would you like to edit a value for this member(y/n):")
if c == "y":
    entry = int(input("- Enter the entry you would like to edit: "))
    if entry == 1:
        d = int(input("- Enter new data: "))
        print(f"- Old data: {dat.wallet}    New data: {d}")
        a = input("- Confirm changes(y/n): ")
        if a == "yes" or "y":
            dat.wallet = d
            save_member_data(userid, dat)
            print("- Data saved!")
        elif a == "no" or "n":
            print("- Aborting...")
    elif entry == 2:
        d = int(input("- Enter new data: "))
        print(f"- Old data: {dat.bank}    New data: {d}")
        a = input("- Confirm changes(y/n): ")
        if a == "yes" or "y":
            dat.bank = d
            save_member_data(userid, dat)
            print("- Data saved!")
        elif a == "no" or "n":
            print("- Aborting...")
    elif entry == 3:
        d = int(input("- Enter new data: "))
        print(f"- Old data: {dat.xp}    New data: {d}")
        a = input("- Confirm changes(y/n): ")
        if a == "yes" or "y":
            dat.xp = d
            save_member_data(userid, dat)
            print("- Data saved!")
        elif a == "no" or "n":
            print("- Aborting...")
    elif entry == 4:
        d = int(input("- Enter new data: "))
        print(f"- Old data: {dat.level}    New data: {d}")
        a = input("- Confirm changes(y/n): ")
        if a == "yes" or "y":
            dat.level = d
            save_member_data(userid, dat)
            print("- Data saved!")
        elif a == "no" or "n":
            print("- Aborting...")
    else:
        print("! Invalid input, exiting...")
        raise SystemExit
else:
    print("- Exiting...")
    raise SystemExit