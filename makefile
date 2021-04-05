SWIFTC=swiftc
AR=ar
RM=rm -rf
CFLAGS=-O
DESTINATION=md

.PHONY: deepclean

$(DESTINATION): main.swift Axe.a BatOfIce.a
	$(SWIFTC) $(CFLAGS) $^ -I. -o $@

Axe.a: Axe.swift
	$(SWIFTC) $(CFLAGS) -emit-library -emit-object $< -module-name $(subst .swift,,$<)
	$(AR) rcs $@ $(subst .swift,.o,$<)
	$(RM) $(subst .swift,.o,$<)
	$(SWIFTC) -emit-module $< -module-name $(subst .swift,,$<)
	
BatOfIce.a: BatOfIce.swift
	$(SWIFTC) $(CFLAGS) -emit-library -emit-object $< -module-name $(subst .swift,,$<)
	$(AR) rcs $@ $(subst .swift,.o,$<)
	$(RM) $(subst .swift,.o,$<)
	$(SWIFTC) -emit-module $< -module-name $(subst .swift,,$<)
	
Character.a: Character.swift
	$(SWIFTC) $(CFLAGS) -emit-library -emit-object $< -module-name $(subst .swift,,$<)
	$(AR) rcs $@ $(subst .swift,.o,$<)
	$(RM) $(subst .swift,.o,$<)
	$(SWIFTC) -emit-module $< -module-name $(subst .swift,,$<)
	
Chest.a: Chest.swift
	$(SWIFTC) $(CFLAGS) -emit-library -emit-object $< -module-name $(subst .swift,,$<)
	$(AR) rcs $@ $(subst .swift,.o,$<)
	$(RM) $(subst .swift,.o,$<)
	$(SWIFTC) -emit-module $< -module-name $(subst .swift,,$<)
	
DevilsHammer.a: DevilsHammer.swift
	$(SWIFTC) $(CFLAGS) -emit-library -emit-object $< -module-name $(subst .swift,,$<)
	$(AR) rcs $@ $(subst .swift,.o,$<)
	$(RM) $(subst .swift,.o,$<)
	$(SWIFTC) -emit-module $< -module-name $(subst .swift,,$<)
	
Dwarf.a: Dwarf.swift
	$(SWIFTC) $(CFLAGS) -emit-library -emit-object $< -module-name $(subst .swift,,$<)
	$(AR) rcs $@ $(subst .swift,.o,$<)
	$(RM) $(subst .swift,.o,$<)
	$(SWIFTC) -emit-module $< -module-name $(subst .swift,,$<)
	
ElementaryOfIce.a: ElementaryOfIce.swift
	$(SWIFTC) $(CFLAGS) -emit-library -emit-object $< -module-name $(subst .swift,,$<)
	$(AR) rcs $@ $(subst .swift,.o,$<)
	$(RM) $(subst .swift,.o,$<)
	$(SWIFTC) -emit-module $< -module-name $(subst .swift,,$<)
	
Fighter.a: Fighter.swift
	$(SWIFTC) $(CFLAGS) -emit-library -emit-object $< -module-name $(subst .swift,,$<)
	$(AR) rcs $@ $(subst .swift,.o,$<)
	$(RM) $(subst .swift,.o,$<)
	$(SWIFTC) -emit-module $< -module-name $(subst .swift,,$<)
	
Game.a: Game.swift
	$(SWIFTC) $(CFLAGS) -emit-library -emit-object $< -module-name $(subst .swift,,$<)
	$(AR) rcs $@ $(subst .swift,.o,$<)
	$(RM) $(subst .swift,.o,$<)
	$(SWIFTC) -emit-module $< -module-name $(subst .swift,,$<)
	
Giant.a: Giant.swift
	$(SWIFTC) $(CFLAGS) -emit-library -emit-object $< -module-name $(subst .swift,,$<)
	$(AR) rcs $@ $(subst .swift,.o,$<)
	$(RM) $(subst .swift,.o,$<)
	$(SWIFTC) -emit-module $< -module-name $(subst .swift,,$<)
	
Mace.a: Mace.swift
	$(SWIFTC) $(CFLAGS) -emit-library -emit-object $< -module-name $(subst .swift,,$<)
	$(AR) rcs $@ $(subst .swift,.o,$<)
	$(RM) $(subst .swift,.o,$<)
	$(SWIFTC) -emit-module $< -module-name $(subst .swift,,$<)
	
MoonLightGreatSword.a: MoonLightGreatSword.swift
	$(SWIFTC) $(CFLAGS) -emit-library -emit-object $< -module-name $(subst .swift,,$<)
	$(AR) rcs $@ $(subst .swift,.o,$<)
	$(RM) $(subst .swift,.o,$<)
	$(SWIFTC) -emit-module $< -module-name $(subst .swift,,$<)
	
Scepter.a: Scepter.swift
	$(SWIFTC) $(CFLAGS) -emit-library -emit-object $< -module-name $(subst .swift,,$<)
	$(AR) rcs $@ $(subst .swift,.o,$<)
	$(RM) $(subst .swift,.o,$<)
	$(SWIFTC) -emit-module $< -module-name $(subst .swift,,$<)
	
SolarSword.a: SolarSword.swift
	$(SWIFTC) $(CFLAGS) -emit-library -emit-object $< -module-name $(subst .swift,,$<)
	$(AR) rcs $@ $(subst .swift,.o,$<)
	$(RM) $(subst .swift,.o,$<)
	$(SWIFTC) -emit-module $< -module-name $(subst .swift,,$<)
	
StaffOfFire.a: StaffOfFire.swift
	$(SWIFTC) $(CFLAGS) -emit-library -emit-object $< -module-name $(subst .swift,,$<)
	$(AR) rcs $@ $(subst .swift,.o,$<)
	$(RM) $(subst .swift,.o,$<)
	$(SWIFTC) -emit-module $< -module-name $(subst .swift,,$<)
	
StaffOfNordrassil.a: StaffOfNordrassil.swift
	$(SWIFTC) $(CFLAGS) -emit-library -emit-object $< -module-name $(subst .swift,,$<)
	$(AR) rcs $@ $(subst .swift,.o,$<)
	$(RM) $(subst .swift,.o,$<)
	$(SWIFTC) -emit-module $< -module-name $(subst .swift,,$<)
	
SwordFishCurved.a: SwordFishCurved.swift
	$(SWIFTC) $(CFLAGS) -emit-library -emit-object $< -module-name $(subst .swift,,$<)
	$(AR) rcs $@ $(subst .swift,.o,$<)
	$(RM) $(subst .swift,.o,$<)
	$(SWIFTC) -emit-module $< -module-name $(subst .swift,,$<)
	
SwordOfAnduril.a: SwordOfAnduril.swift
	$(SWIFTC) $(CFLAGS) -emit-library -emit-object $< -module-name $(subst .swift,,$<)
	$(AR) rcs $@ $(subst .swift,.o,$<)
	$(RM) $(subst .swift,.o,$<)
	$(SWIFTC) -emit-module $< -module-name $(subst .swift,,$<)
	
Sword.a: Sword.swift
	$(SWIFTC) $(CFLAGS) -emit-library -emit-object $< -module-name $(subst .swift,,$<)
	$(AR) rcs $@ $(subst .swift,.o,$<)
	$(RM) $(subst .swift,.o,$<)
	$(SWIFTC) -emit-module $< -module-name $(subst .swift,,$<)
		
TeamFactory.a: TeamFactory.swift
	$(SWIFTC) $(CFLAGS) -emit-library -emit-object $< -module-name $(subst .swift,,$<)
	$(AR) rcs $@ $(subst .swift,.o,$<)
	$(RM) $(subst .swift,.o,$<)
	$(SWIFTC) -emit-module $< -module-name $(subst .swift,,$<)
	
Team.a: Team.swift
	$(SWIFTC) $(CFLAGS) -emit-library -emit-object $< -module-name $(subst .swift,,$<)
	$(AR) rcs $@ $(subst .swift,.o,$<)
	$(RM) $(subst .swift,.o,$<)
	$(SWIFTC) -emit-module $< -module-name $(subst .swift,,$<)
	
Weapon.a: Weapon.swift
	$(SWIFTC) $(CFLAGS) -emit-library -emit-object $< -module-name $(subst .swift,,$<)
	$(AR) rcs $@ $(subst .swift,.o,$<)
	$(RM) $(subst .swift,.o,$<)
	$(SWIFTC) -emit-module $< -module-name $(subst .swift,,$<)
	
Wizard.a: Wizard.swift
	$(SWIFTC) $(CFLAGS) -emit-library -emit-object $< -module-name $(subst .swift,,$<)
	$(AR) rcs $@ $(subst .swift,.o,$<)
	$(RM) $(subst .swift,.o,$<)
	$(SWIFTC) -emit-module $< -module-name $(subst .swift,,$<)
	
	deepclean:
	$(RM) $(DESTINATION) *.a *.bmp *.swiftdoc *.swiftmodule *.swiftsourceinfo
