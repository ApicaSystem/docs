# Adding Configuration files

**Configuration Directory Structure**

The `configurations` directory in the Git repository is intended for storing configuration files corresponding to supported agent types. When adding a new configuration file through the repository, it is important to follow the prescribed directory structure:&#x20;

```
<configurations>/
└── <agent_type>/
    └── <platform>/
        └── <name-of-configuration>/
            └── <path-to-configuration>/
                └── <config-file>
```

### Example: Grafana Alloy Configuration

```
configurations/
└── grafana-alloy/
    └── linux/
        └── default/
            └── etc/
                └── grafana-alloy/
                    └── config.alloy
```

In this example, `default` is the name of the configuration. The Grafana Alloy agent expects its configuration file to be at `/etc/grafana-alloy/config.alloy`, so the directory structure under `default/` mirrors this expected file path.

Following this structure ensures compatibility with automated deployment tools and consistent behavior across platforms.
