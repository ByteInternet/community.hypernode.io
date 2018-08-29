# Hypernode-API Logbook

The following endpoints are available:

```python
GET: https://api.hypernode.com/api/logbook/v1/logbooks/<your_app_name>/flows/
```

## GET
`GET` can be used for retrieving the state of pending, running and previous actions on your Hypernode. This can be helpful for anticipating when a change that you have requested through either the API or the control panel will be propagated. 

The JSON formatted output looks like:
```python
{
    "previous": null,
    "next": "https://api.hypernode.com/api/logbook/v1/logbooks/vdloo/flows/?limit=50&offset=50",
    "count": 2,
    "results": [
        {
            "state": null,
            "progress": {
                "total": 0,
                "running": [],
                "completed": 0
            },
            "uuid": "94a8c1d3-3463-42f4-bdfb-00d58bcc14e7",
            "tracker": {
                "description": null,
                "uuid": null
            },
            "created_at": "2018-08-29T14:40:43Z",
            "updated_at": null,
            "name": "update_node",
            "logbook": "vdloo"
        },
        {
            "state": "running",
            "progress": {
                "total": 24,
                "running": [
                    "stop_mysql_on_volume",
                    "verify_node_fits_on_new_product",
                    "ensure_nodes"
                ],
                "completed": 8
            },
            "uuid": "8eee848b-1be8-4afe-a0bd-56ae8ea10798",
            "tracker": {
                "description": null,
                "uuid": null
            },
            "created_at": "2018-08-29T14:40:37Z",
            "updated_at": "2018-08-29T14:40:40Z",
            "name": "xgrade_app",
            "logbook": "vdloo"
        },
    ]
}
```

Also check out the [hypernode-log](https://support.hypernode.com/changelog/release-5664-follow-migration-process-from-the-commandline/) commandline tool which implements this API.

```bash
$ hypernode-log
ACTION                        	START               	END                 	STATE   	TASKS	RUNNING
update_node                   	2018-08-29T10:05:41Z	2018-08-29T10:11:07Z	success 	4/4 	finished
destroying_node               	2018-08-29T09:42:06Z	2018-08-29T09:42:44Z	success 	7/7 	finished
restore_backup_flow           	2018-08-29T09:20:10Z	2018-08-29T09:26:38Z	success 	21/21	finished
update_node                   	2018-08-29T09:07:07Z	2018-08-29T09:13:34Z	success 	4/4 	finished
ensure_s3_backup_configured   	2018-08-29T09:07:05Z	2018-08-29T09:09:26Z	success 	5/5 	finished
ensure_monitoring_for_app     	2018-08-29T09:07:04Z	2018-08-29T09:09:13Z	success 	6/6 	finished
emergency_rescue              	2018-08-29T09:06:57Z	2018-08-29T09:07:05Z	success 	32/32	finished
xgrade_app_flow               	2018-08-29T08:55:25Z	2018-08-29T09:07:03Z	success 	24/24	finished
```

