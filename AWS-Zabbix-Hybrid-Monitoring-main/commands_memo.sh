# --- 1. Installation Docker (Sur le Serveur) ---
sudo apt update
sudo apt install -y docker.io docker-compose-v2
sudo usermod -aG docker $USER
# Logout/Login required here

# --- 2. Démarrage Zabbix ---
docker compose up -d
docker ps

# --- 3. Client Linux (Agent) ---
wget https://repo.zabbix.com/zabbix/7.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_7.0-2+ubuntu24.04_all.deb
sudo dpkg -i zabbix-release_7.0-2+ubuntu24.04_all.deb
sudo apt update
sudo apt install -y zabbix-agent
# Edit config: sudo nano /etc/zabbix/zabbix_agentd.conf
# Change: Server=10.0.1.X
sudo systemctl restart zabbix-agent
sudo systemctl enable zabbix-agent

# --- 4. Client Windows ---
# Installer MSI -> IP Serveur: 10.0.1.X -> Port 10050
