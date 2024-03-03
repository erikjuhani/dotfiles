init:
	./init.sh && ./scripts/environment/symlink.sh

ssh-key:
	./scripts/environment/ssh-key.sh $(service) $(author)

.PHONY: init ssh-key
