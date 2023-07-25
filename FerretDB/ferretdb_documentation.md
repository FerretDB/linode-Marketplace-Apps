## FerretDB Marketplace App

<!-- Intro paragraph describing the app and what it accomplishes. -->
FerretDB is an open-source proxy that translates MongoDB wire protocol queries to SQL, with PostgreSQL, or SQLite as the database engine.

Initially built as open-source software, MongoDB was a game-changer for many developers, enabling them to build fast and robust applications. Its ease of use and extensive documentation made it a top choice for many developers looking for an open-source database. However, all this changed when they switched to an SSPL license, moving away from their open-source roots.

In light of this, FerretDB was founded to become the true open-source alternative to MongoDB, making it the go-to choice for most MongoDB users looking for an open-source alternative to MongoDB. With FerretDB, users can run the same MongoDB protocol queries without needing to learn a new language or command.

### Deploy a FerretDB Marketplace App

<!-- shortguide used by every Marketplace app to describe how to deploy from the Cloud Manger -->

{{< content "deploy-marketplace-apps">}}

### FerretDB Options

<!-- The following table has three parts. The UDF name, in bold and in one column, followed by
     UDF description in the second column. The description is in normal text, with an optional
     "Required." tag at the end of the description, in italics, if the field is mandatory. -->
You can configure your FerretDB App by providing values for the following fields:

| **Field** | **Description** |
|:--------------|:------------|
| **username** | Username for authentication, default value is "username". *Required*. |
| **username** | Password for authentication, default value is "password". *Required*. |
| **ipaddr** | Listen TCP address, default value is "127.0.0.1". *Required*. |

### Linode Options

After providing the App-specific options, provide configurations for your Linode server:
<!-- Be sure to edit the Select an Image and Linode Plan to match app's needs -->

| **Configuration** | **Description** |
|:--------------|:------------|
| **Select an Image** | Ubuntu 20.04 is currently the only image supported by the FerretDB Marketplace App, and it is pre-selected on the Linode creation page. *Required*. |
| **Region** | The region where you would like your Linode to reside. In general, it's best to choose a location that's closest to you. For more information on choosing a DC, review the [How to Choose a Data Center](/docs/guides/how-to-choose-a-data-center) guide. You can also generate [MTR reports](/docs/guides/diagnosing-network-issues-with-mtr/) for a deeper look at the network routes between you and each of our data centers. *Required*. |
| **Linode Plan** | Your Linode's [hardware resources](/docs/guides/how-to-choose-a-linode-plan/#hardware-resource-definitions). FerretDB can be supported on any size Linode, but we suggest you deploy your FerretDB App on a Linode plan that reflects how you plan on using it. If you decide that you need more or fewer hardware resources after you deploy your app, you can always [resize your Linode](/docs/guides/resizing-a-linode/) to a different plan. *Required*. |
| **Linode Label** | The name for your Linode, which must be unique between all of the Linodes on your account. This name is how you identify your server in the Cloud Manager Dashboard. *Required*. |
| **Root Password** | The primary administrative password for your Linode instance. This password must be provided when you log in to your Linode via SSH. The password must meet the complexity strength validation requirements for a strong password. Your root password can be used to perform any action on your server, so make it long, complex, and unique. *Required*. |

<!-- the following disclaimer lets the user know how long it will take
     to deploy the app -->
After providing all required Linode Options, click on the **Create** button. **Your FerretDB App will complete installation anywhere between 5-10 minutes after your Linode has finished provisioning**.

## Getting Started after Deployment

<!-- the following headings and paragraphs outline the steps necessary
     to access and interact with the Marketplace app. -->

### Connect to FerretDB

To use the MongoDB Shell, first download and install it [here](https://www.mongodb.com/docs/mongodb-shell/install/). Please note that FerretDB currently supports the PLAIN authentication mechanism, _only_. Using other mechanisms will not work.

```
mongosh "mongodb://username:password@your_server_public_ipv4:27017/?authMechanism=PLAIN"
```

### Getting Logs

```
journalctl -u ferretdb.service
```

Refer to the [flags](https://docs.ferretdb.io/configuration/flags/#miscellaneous) to adjust the log level.

### Next Steps

- Start developing with an official MongoDB
 driver [here](https://www.mongodb.com/docs/drivers/).
- Basic [CRUD operations](https://docs.ferretdb.io/category/basic-crud-operations/).
- [Operators](https://docs.ferretdb.io/category/operators/).
- [Aggregation Operations](https://docs.ferretdb.io/category/aggregation-operations/).
- [Query pushdown](https://docs.ferretdb.io/pushdown/).
- [Indexes](https://docs.ferretdb.io/indexes/).
- [Security](https://docs.ferretdb.io/category/security/).
- See the known differences [here](https://docs.ferretdb.io/diff/).
- Public [roadmap](https://github.com/orgs/FerretDB/projects/2).

## For further documentation visit:
- [Documentation for users](https://docs.ferretdb.io/).
- [Documentation for Go developers about embeddable FerretDB](https://pkg.go.dev/github.com/FerretDB/FerretDB/ferretdb).
-  [Supported commands](https://docs.ferretdb.io/reference/supported-commands/)
<!-- the following shortcode informs the user that Linode does not provide automatic updates
     to the Marketplace app, and that the user is responsible for the security and longevity
     of the installation. -->
{{< content "marketplace-update-note">}}
