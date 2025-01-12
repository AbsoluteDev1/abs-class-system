-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_INITIALIZE_CASH
-- @usage void NETWORK_INITIALIZE_CASH(int p0, int p1);
-- @param p0 int
-- @param p1 int
-- @return void
function NetworkInitializeCash(p0, p1) end

-- Note the 2nd parameters are always 1, 0. I have a feeling it deals with your money, wallet, bank. So when you delete the character it of course wipes the wallet cash at that time. So if that was the case, it would be eg, NETWORK_DELETE_CHARACTER(characterIndex, deleteWalletCash, deleteBankCash);
-- @module native
-- @submodule networkcash
-- @see NETWORK_DELETE_CHARACTER
-- @usage void NETWORK_DELETE_CHARACTER(int characterIndex, BOOL p1, BOOL p2);
-- @param characterIndex int
-- @param p1 BOOL
-- @param p2 BOOL
-- @return void
function NetworkDeleteCharacter(characterIndex, p1, p2) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_CLEAR_CHARACTER_WALLET
-- @usage void NETWORK_CLEAR_CHARACTER_WALLET(Any p0);
-- @param p0 Any
-- @return void
function NetworkClearCharacterWallet(p0) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_GIVE_PLAYER_JOBSHARE_CASH
-- @usage void NETWORK_GIVE_PLAYER_JOBSHARE_CASH(int amount, int* networkHandle);
-- @param amount int
-- @param networkHandle int*
-- @return void
function NetworkGivePlayerJobshareCash(amount, networkHandle) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_RECEIVE_PLAYER_JOBSHARE_CASH
-- @usage void NETWORK_RECEIVE_PLAYER_JOBSHARE_CASH(int value, int* networkHandle);
-- @param value int
-- @param networkHandle int*
-- @return void
function NetworkReceivePlayerJobshareCash(value, networkHandle) end

-- index ------- See function sub_1005 in am_boat_taxi.ysc  context ---------- "BACKUP_VAGOS" "BACKUP_LOST" "BACKUP_FAMILIES" "HIRE_MUGGER" "HIRE_MERCENARY" "BUY_CARDROPOFF" "HELI_PICKUP" "BOAT_PICKUP" "CLEAR_WANTED" "HEAD_2_HEAD" "CHALLENGE" "SHARE_LAST_JOB" "DEFAULT"  reason --------- "NOTREACHTARGET" "TARGET_ESCAPE" "DELIVERY_FAIL" "NOT_USED" "TEAM_QUIT" "SERVER_ERROR" "RECEIVE_LJ_L" "CHALLENGE_PLAYER_LEFT" "DEFAULT"  unk ----- Unknown bool value
-- @module native
-- @submodule networkcash
-- @see NETWORK_REFUND_CASH
-- @usage void NETWORK_REFUND_CASH(int index, char* context, char* reason, BOOL unk);
-- @param index int
-- @param context char*
-- @param reason char*
-- @param unk BOOL
-- @return void
function NetworkRefundCash(index, context, reason, unk) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_MONEY_CAN_BET
-- @usage BOOL NETWORK_MONEY_CAN_BET(Any p0, BOOL p1, BOOL p2);
-- @param p0 Any
-- @param p1 BOOL
-- @param p2 BOOL
-- @return BOOL
function NetworkMoneyCanBet(p0, p1, p2) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_CAN_BET
-- @usage BOOL NETWORK_CAN_BET(Any p0);
-- @param p0 Any
-- @return BOOL
function NetworkCanBet(p0) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_EARN_FROM_PICKUP
-- @usage Any NETWORK_EARN_FROM_PICKUP(int amount);
-- @param amount int
-- @return Any
function NetworkEarnFromPickup(amount) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_EARN_FROM_CRATE_DROP
-- @usage void NETWORK_EARN_FROM_CRATE_DROP(int amount);
-- @param amount int
-- @return void
function NetworkEarnFromCrateDrop(amount) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_EARN_FROM_BETTING
-- @usage void NETWORK_EARN_FROM_BETTING(int amount, char* p1);
-- @param amount int
-- @param p1 char*
-- @return void
function NetworkEarnFromBetting(amount, p1) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_EARN_FROM_JOB
-- @usage void NETWORK_EARN_FROM_JOB(int amount, char* p1);
-- @param amount int
-- @param p1 char*
-- @return void
function NetworkEarnFromJob(amount, p1) end

-- Pretty sure this is actually a hash collision. It should be NETWORK_EARN_FROM_A*** or NETWORK_EARN_FROM_B*** ============================================================= Not a hash collision, test it for yourself when finishing heist. lackos; 2017.03.12
-- @module native
-- @submodule networkcash
-- @see NETWORK_EARN_FROM_MISSION_H
-- @usage void NETWORK_EARN_FROM_MISSION_H(int amount, char* heistHash);
-- @param amount int
-- @param heistHash char*
-- @return void
function NetworkEarnFromMissionH(amount, heistHash) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_EARN_FROM_CHALLENGE_WIN
-- @usage void NETWORK_EARN_FROM_CHALLENGE_WIN(Any p0, Any* p1, BOOL p2);
-- @param p0 Any
-- @param p1 Any*
-- @param p2 BOOL
-- @return void
function NetworkEarnFromChallengeWin(p0, p1, p2) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_EARN_FROM_BOUNTY
-- @usage void NETWORK_EARN_FROM_BOUNTY(int amount, int* networkHandle, Any* p2, Any p3);
-- @param amount int
-- @param networkHandle int*
-- @param p2 Any*
-- @param p3 Any
-- @return void
function NetworkEarnFromBounty(amount, networkHandle, p2, p3) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_EARN_FROM_IMPORT_EXPORT
-- @usage void NETWORK_EARN_FROM_IMPORT_EXPORT(Any p0, Any p1);
-- @param p0 Any
-- @param p1 Any
-- @return void
function NetworkEarnFromImportExport(p0, p1) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_EARN_FROM_HOLDUPS
-- @usage void NETWORK_EARN_FROM_HOLDUPS(int amount);
-- @param amount int
-- @return void
function NetworkEarnFromHoldups(amount) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_EARN_FROM_PROPERTY
-- @usage void NETWORK_EARN_FROM_PROPERTY(int amount, Hash propertyName);
-- @param amount int
-- @param propertyName Hash
-- @return void
function NetworkEarnFromProperty(amount, propertyName) end

-- DSPORT
-- @module native
-- @submodule networkcash
-- @see NETWORK_EARN_FROM_AI_TARGET_KILL
-- @usage void NETWORK_EARN_FROM_AI_TARGET_KILL(Any p0, Any p1);
-- @param p0 Any
-- @param p1 Any
-- @return void
function NetworkEarnFromAiTargetKill(p0, p1) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_EARN_FROM_NOT_BADSPORT
-- @usage void NETWORK_EARN_FROM_NOT_BADSPORT(int amount);
-- @param amount int
-- @return void
function NetworkEarnFromNotBadsport(amount) end

-- This merely adds an entry in the Network Transaction Log;  it does not grant cash to the player (on PC).  Max value for amount is 9999999.
-- @module native
-- @submodule networkcash
-- @see NETWORK_EARN_FROM_ROCKSTAR
-- @usage void NETWORK_EARN_FROM_ROCKSTAR(int amount);
-- @param amount int
-- @return void
function NetworkEarnFromRockstar(amount) end

-- Now has 8 params.
-- @module native
-- @submodule networkcash
-- @see NETWORK_EARN_FROM_VEHICLE
-- @usage void NETWORK_EARN_FROM_VEHICLE(Any p0, Any p1, Any p2, Any p3, Any p4, Any p5, Any p6, Any p7);
-- @param p0 Any
-- @param p1 Any
-- @param p2 Any
-- @param p3 Any
-- @param p4 Any
-- @param p5 Any
-- @param p6 Any
-- @param p7 Any
-- @return void
function NetworkEarnFromVehicle(p0, p1, p2, p3, p4, p5, p6, p7) end

-- Now has 9 parameters.
-- @module native
-- @submodule networkcash
-- @see NETWORK_EARN_FROM_PERSONAL_VEHICLE
-- @usage void NETWORK_EARN_FROM_PERSONAL_VEHICLE(Any p0, Any p1, Any p2, Any p3, Any p4, Any p5, Any p6, Any p7, Any p8);
-- @param p0 Any
-- @param p1 Any
-- @param p2 Any
-- @param p3 Any
-- @param p4 Any
-- @param p5 Any
-- @param p6 Any
-- @param p7 Any
-- @param p8 Any
-- @return void
function NetworkEarnFromPersonalVehicle(p0, p1, p2, p3, p4, p5, p6, p7, p8) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_CAN_SPEND_MONEY
-- @usage BOOL NETWORK_CAN_SPEND_MONEY(Any p0, BOOL p1, BOOL p2, BOOL p3, Any p4);
-- @param p0 Any
-- @param p1 BOOL
-- @param p2 BOOL
-- @param p3 BOOL
-- @param p4 Any
-- @return BOOL
function NetworkCanSpendMoney(p0, p1, p2, p3, p4) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_BUY_ITEM
-- @usage void NETWORK_BUY_ITEM(Ped player, Hash item, Any p2, Any p3, BOOL p4, char* item_name, Any p6, Any p7, Any p8, BOOL p9);
-- @param player Ped
-- @param item Hash
-- @param p2 Any
-- @param p3 Any
-- @param p4 BOOL
-- @param item_name char*
-- @param p6 Any
-- @param p7 Any
-- @param p8 Any
-- @param p9 BOOL
-- @return void
function NetworkBuyItem(player, item, p2, p3, p4, item_name, p6, p7, p8, p9) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_SPENT_TAXI
-- @usage void NETWORK_SPENT_TAXI(int amount, BOOL p1, BOOL p2);
-- @param amount int
-- @param p1 BOOL
-- @param p2 BOOL
-- @return void
function NetworkSpentTaxi(amount, p1, p2) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_PAY_EMPLOYEE_WAGE
-- @usage void NETWORK_PAY_EMPLOYEE_WAGE(Any p0, BOOL p1, BOOL p2);
-- @param p0 Any
-- @param p1 BOOL
-- @param p2 BOOL
-- @return void
function NetworkPayEmployeeWage(p0, p1, p2) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_PAY_UTILITY_BILL
-- @usage void NETWORK_PAY_UTILITY_BILL(Any p0, BOOL p1, BOOL p2);
-- @param p0 Any
-- @param p1 BOOL
-- @param p2 BOOL
-- @return void
function NetworkPayUtilityBill(p0, p1, p2) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_PAY_MATCH_ENTRY_FEE
-- @usage void NETWORK_PAY_MATCH_ENTRY_FEE(int value, int* p1, BOOL p2, BOOL p3);
-- @param value int
-- @param p1 int*
-- @param p2 BOOL
-- @param p3 BOOL
-- @return void
function NetworkPayMatchEntryFee(value, p1, p2, p3) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_SPENT_BETTING
-- @usage void NETWORK_SPENT_BETTING(Any p0, Any p1, Any* p2, BOOL p3, BOOL p4);
-- @param p0 Any
-- @param p1 Any
-- @param p2 Any*
-- @param p3 BOOL
-- @param p4 BOOL
-- @return void
function NetworkSpentBetting(p0, p1, p2, p3, p4) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_SPENT_IN_STRIPCLUB
-- @usage void NETWORK_SPENT_IN_STRIPCLUB(Any p0, BOOL p1, Any p2, BOOL p3);
-- @param p0 Any
-- @param p1 BOOL
-- @param p2 Any
-- @param p3 BOOL
-- @return void
function NetworkSpentInStripclub(p0, p1, p2, p3) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_BUY_HEALTHCARE
-- @usage void NETWORK_BUY_HEALTHCARE(int cost, BOOL p1, BOOL p2);
-- @param cost int
-- @param p1 BOOL
-- @param p2 BOOL
-- @return void
function NetworkBuyHealthcare(cost, p1, p2) end

-- p1 = 0 (always) p2 = 1 (always)
-- @module native
-- @submodule networkcash
-- @see NETWORK_BUY_AIRSTRIKE
-- @usage void NETWORK_BUY_AIRSTRIKE(int cost, BOOL p1, BOOL p2);
-- @param cost int
-- @param p1 BOOL
-- @param p2 BOOL
-- @return void
function NetworkBuyAirstrike(cost, p1, p2) end

-- p1 = 0 (always) p2 = 1 (always)
-- @module native
-- @submodule networkcash
-- @see NETWORK_BUY_HELI_STRIKE
-- @usage void NETWORK_BUY_HELI_STRIKE(int cost, BOOL p1, BOOL p2);
-- @param cost int
-- @param p1 BOOL
-- @param p2 BOOL
-- @return void
function NetworkBuyHeliStrike(cost, p1, p2) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_SPENT_AMMO_DROP
-- @usage void NETWORK_SPENT_AMMO_DROP(Any p0, BOOL p1, BOOL p2);
-- @param p0 Any
-- @param p1 BOOL
-- @param p2 BOOL
-- @return void
function NetworkSpentAmmoDrop(p0, p1, p2) end

-- p1 is just an assumption. p2 was false and p3 was true.
-- @module native
-- @submodule networkcash
-- @see NETWORK_BUY_BOUNTY
-- @usage void NETWORK_BUY_BOUNTY(int amount, Player victim, BOOL p2, BOOL p3);
-- @param amount int
-- @param victim Player
-- @param p2 BOOL
-- @param p3 BOOL
-- @return void
function NetworkBuyBounty(amount, victim, p2, p3) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_BUY_PROPERTY
-- @usage void NETWORK_BUY_PROPERTY(float propertyCost, Hash propertyName, BOOL p2, BOOL p3);
-- @param propertyCost float
-- @param propertyName Hash
-- @param p2 BOOL
-- @param p3 BOOL
-- @return void
function NetworkBuyProperty(propertyCost, propertyName, p2, p3) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_SPENT_HELI_PICKUP
-- @usage void NETWORK_SPENT_HELI_PICKUP(Any p0, BOOL p1, BOOL p2);
-- @param p0 Any
-- @param p1 BOOL
-- @param p2 BOOL
-- @return void
function NetworkSpentHeliPickup(p0, p1, p2) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_SPENT_BOAT_PICKUP
-- @usage void NETWORK_SPENT_BOAT_PICKUP(Any p0, BOOL p1, BOOL p2);
-- @param p0 Any
-- @param p1 BOOL
-- @param p2 BOOL
-- @return void
function NetworkSpentBoatPickup(p0, p1, p2) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_SPENT_BULL_SHARK
-- @usage void NETWORK_SPENT_BULL_SHARK(Any p0, BOOL p1, BOOL p2);
-- @param p0 Any
-- @param p1 BOOL
-- @param p2 BOOL
-- @return void
function NetworkSpentBullShark(p0, p1, p2) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_SPENT_CASH_DROP
-- @usage void NETWORK_SPENT_CASH_DROP(int amount, BOOL p1, BOOL p2);
-- @param amount int
-- @param p1 BOOL
-- @param p2 BOOL
-- @return void
function NetworkSpentCashDrop(amount, p1, p2) end

-- Only used once in a script (am_contact_requests) p1 = 0 p2 = 1
-- @module native
-- @submodule networkcash
-- @see NETWORK_SPENT_HIRE_MUGGER
-- @usage void NETWORK_SPENT_HIRE_MUGGER(Any p0, BOOL p1, BOOL p2);
-- @param p0 Any
-- @param p1 BOOL
-- @param p2 BOOL
-- @return void
function NetworkSpentHireMugger(p0, p1, p2) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_SPENT_ROBBED_BY_MUGGER
-- @usage void NETWORK_SPENT_ROBBED_BY_MUGGER(int amount, BOOL p1, BOOL p2);
-- @param amount int
-- @param p1 BOOL
-- @param p2 BOOL
-- @return void
function NetworkSpentRobbedByMugger(amount, p1, p2) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_SPENT_HIRE_MERCENARY
-- @usage void NETWORK_SPENT_HIRE_MERCENARY(Any p0, BOOL p1, BOOL p2);
-- @param p0 Any
-- @param p1 BOOL
-- @param p2 BOOL
-- @return void
function NetworkSpentHireMercenary(p0, p1, p2) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_SPENT_BUY_WANTEDLEVEL
-- @usage void NETWORK_SPENT_BUY_WANTEDLEVEL(Any p0, Any* p1, BOOL p2, BOOL p3);
-- @param p0 Any
-- @param p1 Any*
-- @param p2 BOOL
-- @param p3 BOOL
-- @return void
function NetworkSpentBuyWantedlevel(p0, p1, p2, p3) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_SPENT_BUY_OFFTHERADAR
-- @usage void NETWORK_SPENT_BUY_OFFTHERADAR(Any p0, BOOL p1, BOOL p2);
-- @param p0 Any
-- @param p1 BOOL
-- @param p2 BOOL
-- @return void
function NetworkSpentBuyOfftheradar(p0, p1, p2) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_SPENT_BUY_REVEAL_PLAYERS
-- @usage void NETWORK_SPENT_BUY_REVEAL_PLAYERS(Any p0, BOOL p1, BOOL p2);
-- @param p0 Any
-- @param p1 BOOL
-- @param p2 BOOL
-- @return void
function NetworkSpentBuyRevealPlayers(p0, p1, p2) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_SPENT_CARWASH
-- @usage void NETWORK_SPENT_CARWASH(Any p0, Any p1, Any p2, BOOL p3, BOOL p4);
-- @param p0 Any
-- @param p1 Any
-- @param p2 Any
-- @param p3 BOOL
-- @param p4 BOOL
-- @return void
function NetworkSpentCarwash(p0, p1, p2, p3, p4) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_SPENT_CINEMA
-- @usage void NETWORK_SPENT_CINEMA(Any p0, Any p1, BOOL p2, BOOL p3);
-- @param p0 Any
-- @param p1 Any
-- @param p2 BOOL
-- @param p3 BOOL
-- @return void
function NetworkSpentCinema(p0, p1, p2, p3) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_SPENT_TELESCOPE
-- @usage void NETWORK_SPENT_TELESCOPE(Any p0, BOOL p1, BOOL p2);
-- @param p0 Any
-- @param p1 BOOL
-- @param p2 BOOL
-- @return void
function NetworkSpentTelescope(p0, p1, p2) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_SPENT_HOLDUPS
-- @usage void NETWORK_SPENT_HOLDUPS(Any p0, BOOL p1, BOOL p2);
-- @param p0 Any
-- @param p1 BOOL
-- @param p2 BOOL
-- @return void
function NetworkSpentHoldups(p0, p1, p2) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_SPENT_BUY_PASSIVE_MODE
-- @usage void NETWORK_SPENT_BUY_PASSIVE_MODE(Any p0, BOOL p1, BOOL p2);
-- @param p0 Any
-- @param p1 BOOL
-- @param p2 BOOL
-- @return void
function NetworkSpentBuyPassiveMode(p0, p1, p2) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_SPENT_PROSTITUTES
-- @usage void NETWORK_SPENT_PROSTITUTES(Any p0, BOOL p1, BOOL p2);
-- @param p0 Any
-- @param p1 BOOL
-- @param p2 BOOL
-- @return void
function NetworkSpentProstitutes(p0, p1, p2) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_SPENT_ARREST_BAIL
-- @usage void NETWORK_SPENT_ARREST_BAIL(Any p0, BOOL p1, BOOL p2);
-- @param p0 Any
-- @param p1 BOOL
-- @param p2 BOOL
-- @return void
function NetworkSpentArrestBail(p0, p1, p2) end

-- According to how I understood this in the freemode script alone, The first parameter is determined by a function named, func_5749 within the freemode script which has a list of all the vehicles and a set price to return which some vehicles deals with globals as well. So the first parameter is basically the set in stone insurance cost it's gonna charge you for that specific vehicle model.  The second parameter whoever put it was right, they call GET_ENTITY_MODEL with the vehicle as the paremeter.  The third parameter is the network handle as they call their little struct<13> func or atleast how the script decompiled it to look which in lamens terms just returns the network handle of the previous owner based on DECOR_GET_INT(vehicle, "Previous_Owner").  The fourth parameter is a bool that returns true/false depending on if your bank balance is greater then 0.  The fifth and last parameter is a bool that returns true/false depending on if you have the money for the car based on the cost returned by func_5749. In the freemode script eg, bool hasTheMoney = NETWORKCASH::_GET_BANK_BALANCE() < carCost.
-- @module native
-- @submodule networkcash
-- @see NETWORK_SPENT_PAY_VEHICLE_INSURANCE_PREMIUM
-- @usage void NETWORK_SPENT_PAY_VEHICLE_INSURANCE_PREMIUM(int amount, Hash vehicleModel, int* networkHandle, BOOL notBankrupt, BOOL hasTheMoney);
-- @param amount int
-- @param vehicleModel Hash
-- @param networkHandle int*
-- @param notBankrupt BOOL
-- @param hasTheMoney BOOL
-- @return void
function NetworkSpentPayVehicleInsurancePremium(amount, vehicleModel, networkHandle, notBankrupt, hasTheMoney) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_SPENT_CALL_PLAYER
-- @usage void NETWORK_SPENT_CALL_PLAYER(Any p0, Any* p1, BOOL p2, BOOL p3);
-- @param p0 Any
-- @param p1 Any*
-- @param p2 BOOL
-- @param p3 BOOL
-- @return void
function NetworkSpentCallPlayer(p0, p1, p2, p3) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_SPENT_BOUNTY
-- @usage void NETWORK_SPENT_BOUNTY(Any p0, BOOL p1, BOOL p2);
-- @param p0 Any
-- @param p1 BOOL
-- @param p2 BOOL
-- @return void
function NetworkSpentBounty(p0, p1, p2) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_SPENT_FROM_ROCKSTAR
-- @usage void NETWORK_SPENT_FROM_ROCKSTAR(int bank, BOOL p1, BOOL p2);
-- @param bank int
-- @param p1 BOOL
-- @param p2 BOOL
-- @return void
function NetworkSpentFromRockstar(bank, p1, p2) end

-- This isn't a hash collision. It is used to give the player cash via the CASH_GIFT stats.
-- @module native
-- @submodule networkcash
-- @see PROCESS_CASH_GIFT
-- @usage char* PROCESS_CASH_GIFT(int* p0, int* p1, char* p2);
-- @param p0 int*
-- @param p1 int*
-- @param p2 char*
-- @return char*
function ProcessCashGift(p0, p1, p2) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_SPENT_PLAYER_HEALTHCARE
-- @usage void NETWORK_SPENT_PLAYER_HEALTHCARE(Any p0, Any p1, BOOL p2, BOOL p3);
-- @param p0 Any
-- @param p1 Any
-- @param p2 BOOL
-- @param p3 BOOL
-- @return void
function NetworkSpentPlayerHealthcare(p0, p1, p2, p3) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_SPENT_NO_COPS
-- @usage void NETWORK_SPENT_NO_COPS(Any p0, BOOL p1, BOOL p2);
-- @param p0 Any
-- @param p1 BOOL
-- @param p2 BOOL
-- @return void
function NetworkSpentNoCops(p0, p1, p2) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_SPENT_REQUEST_JOB
-- @usage void NETWORK_SPENT_REQUEST_JOB(Any p0, BOOL p1, BOOL p2);
-- @param p0 Any
-- @param p1 BOOL
-- @param p2 BOOL
-- @return void
function NetworkSpentRequestJob(p0, p1, p2) end

-- The first parameter is the amount spent which is store in a global when this native is called. The global returns 10. Which is the price for both rides.  The last 3 parameters are,  2,0,1 in the am_ferriswheel.c 1,0,1 in the am_rollercoaster.c
-- @module native
-- @submodule networkcash
-- @see NETWORK_BUY_FAIRGROUND_RIDE
-- @usage void NETWORK_BUY_FAIRGROUND_RIDE(int amountSpent, Any p1, BOOL p2, BOOL p3);
-- @param amountSpent int
-- @param p1 Any
-- @param p2 BOOL
-- @param p3 BOOL
-- @return void
function NetworkBuyFairgroundRide(amountSpent, p1, p2, p3) end

-- From what I can see in ida, I believe it retrieves the players online bank balance.
-- @module native
-- @submodule networkcash
-- @see NETWORK_GET_VC_BANK_BALANCE
-- @usage int NETWORK_GET_VC_BANK_BALANCE();
-- @return int
function NetworkGetVcBankBalance() end

-- From what I understand, it retrieves STAT_WALLET_BALANCE for the specified character (-1 means use MPPLY_LAST_MP_CHAR)
-- @module native
-- @submodule networkcash
-- @see NETWORK_GET_VC_WALLET_BALANCE
-- @usage int NETWORK_GET_VC_WALLET_BALANCE(int character);
-- @param character int
-- @return int
function NetworkGetVcWalletBalance(character) end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_GET_VC_BALANCE
-- @usage int NETWORK_GET_VC_BALANCE();
-- @return int
function NetworkGetVcBalance() end

-- @todo
-- @module native
-- @submodule networkcash
-- @see NETWORK_CAN_RECEIVE_PLAYER_CASH
-- @usage BOOL NETWORK_CAN_RECEIVE_PLAYER_CASH(Any p0, Any p1, Any p2, Any p3);
-- @param p0 Any
-- @param p1 Any
-- @param p2 Any
-- @param p3 Any
-- @return BOOL
function NetworkCanReceivePlayerCash(p0, p1, p2, p3) end