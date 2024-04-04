#   Copyright (C) 2023 John Törnblom
#
# This file is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; see the file COPYING. If not see
# <http://www.gnu.org/licenses/>.

PS5_HOST ?= ps5
PS5_PORT ?= 9021

ifdef PS5_PAYLOAD_SDK
    include $(PS5_PAYLOAD_SDK)/make/x86_64-ps5-payload.inc
else
    $(error PS5_PAYLOAD_SDK is undefined)
endif

ELF := klogsrv.elf

CFLAGS := -Wall -Werror
LDADD  := -lkernel_web -lSceLibcInternal

all: $(ELF)

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $^

$(ELF): main.o
	$(LD) $^ $(LDADD) -o $@

clean:
	rm -f *.o $(ELF)

test: $(ELF)
	$(PS5_PAYLOAD_DEPLOY) -h $(PS5_HOST) -p $(PS5_PORT) $^

