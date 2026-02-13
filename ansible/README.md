# 競技用インスタンスのセットアップ方法

```bash
# webapp
ansible-playbook -i hosts image/ansible/playbooks.yml

# bench
ansible-playbook -i hosts bench/ansible/playbooks.yml
```

## benchmaker を 同梱した webapp

webapp と benchmaker両方含む all in one なインスタンスをセットアップする場合

```bash
# 起動
ansible-playbook -i hosts image/ansible/playbooks.yml -e 'allinone=True'

# ベンチマーク実行
sudo su - isucon
/home/isucon/private_isu/benchmarker/bin/benchmarker -u /home/isucon/private_isu/benchmarker/userdata -t http://<target IP>
```

## ssh config の例

```: ~/.ssh/config
Host isu-app
  IdentityFile ~/.ssh/xxx.pem
  HostName xxx.xxx.xxx.xxx
  User ubuntu

Host isu-bench
  IdentityFile ~/.ssh/xxx.pem
  HostName xxx.xxx.xxx.xxx
  User ubuntu
```
