# private-isu

自分用に簡略化

## Local

```bash
# 初期データ投入
make ini

# 開発サーバー起動
make dev

# ベンチマーク実行
make bench
```

## Remote

### setup infrastructure

- [Terraform 実行](./terraform/README.md)
- [Ansible 実行](./provisioning/README.md)

### benchmark

```bash
# ベンチマーカーインスタンス上での実行方法
sudo su - isucon
/home/isucon/private_isu/benchmarker/bin/benchmarker -u /home/isucon/private_isu/benchmarker/userdata -t http://<target IP>

# 競技者用インスタンス上でのベンチマーカー実行方法
sudo su - isucon
/home/isucon/private_isu/benchmarker/bin/benchmarker -u /home/isucon/private_isu/benchmarker/userdata -t http://localhost
```

## 元のやつ

[catatsuy/private-isu](https://github.com/catatsuy/private-isu)
