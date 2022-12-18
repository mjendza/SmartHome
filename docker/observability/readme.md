# troubleshooting
## docker
### loki loggs
#### don't see logs in locki
##### check if plugin to push docker instance logs to loki
```
/var/log$ tail -n 100 syslog
```

```
grep plugin= syslog
```