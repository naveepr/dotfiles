SHELL := /bin/bash
.SUFFIXES:

.PHONY: all
all: install

SYMLINK = cd $(HOME); ln -si $(notdir $(CURDIR))/$(1) .$(notdir $(1)) || true

BASHRC_D := bashrc.d
BASH_PROFILE := bash_profile
BASH_ALIASES := bash_aliases
INSTALL_TARGETS += $(BASHRC_D) $(BASH_PROFILE) $(BASH_ALIASES)

$(HOME)/.$(BASHRC_D): $(BASHRC_D)
	$(call SYMLINK,$?)

$(HOME)/.$(BASH_PROFILE): $(BASH_PROFILE)
	$(call SYMLINK,$?)

$(HOME)/.$(BASH_ALIASES): $(BASH_ALIASES)
	$(call SYMLINK,$?)

VIMRC := vimrc
INSTALL_TARGETS += $(VIMRC)

$(HOME)/.$(VIMRC): $(VIMRC)
	$(call SYMLINK,$?)

# GITCONFIG := gitconfig
# INSTALL_TARGETS += $(GITCONFIG)

# $(HOME)/.$(GITCONFIG): $(GITCONFIG)
# 	cp -i $? $@ || true

.PHONY: install
install: $(foreach x,$(INSTALL_TARGETS),$(HOME)/.$(x))

clean:
	rm -rf ~/.bashrc.d ~/.bash_aliases ~/.bash_profile ~/.vimrc
