# Ansible Homework – Nginx + Jinja2

## Goal
Provision two VMs with Vagrant:
# Ansible Homework – Nginx + Jinja2

## Goal
Provision two VMs with Vagrant:

- `ansible` (control node)
- `web` (managed node)

Use Ansible to install and start Nginx on `web` and deploy a Jinja2-rendered homepage.
Host port `8888` is forwarded to `web:80`.

## Project structure

- `Vagrantfile` – defines the two VMs
- `provision/ansible_setup.sh` – installs Ansible + Git on the control node
- `provision/web_setup.sh` – creates the `homework` user + passwordless sudo on the web node
- `shared/inventory` – Ansible inventory
- `nginx_install.yml` – playbook
- `templates/index.html.j2` – homepage template

## How to run

From the host machine:

1. Start the VMs:

```bash
vagrant up
```

2. SSH into the control node:

```bash
vagrant ssh ansible
```

3. (First time only) Add the web node to known hosts (run on host or control node):

```bash
ssh-keyscan -H 192.168.56.212 >> ~/.ssh/known_hosts
```

4. Run the playbook (on the control node or from the synced `/shared` folder):

```bash
cd /shared
ansible-playbook -i ./inventory ./nginx_install.yml
```

5. Verify

Open your browser at:

```
http://localhost:8888
```

You should see a page rendered from `templates/index.html.j2` (example: "Zsolt Csengeri").

### Idempotency

Re-running the playbook should result in `changed=0` for already-applied tasks.

(If you run the playbook from a different path, adjust the `cd /shared` step accordingly.)

---


