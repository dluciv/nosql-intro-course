## [А что с нашими любимыми СУБД?](https://en.wikipedia.org/wiki/PACELC_theorem#Database_PACELC_ratings)

<table>
<thead><tr>
<th>DDBS</th>
<th>P+A</th>
<th>P+C</th>
<th>E+L</th>
<th>E+C</th>
</tr></thead>
<tbody><tr>
<td>Dynamo</td>
<td>Yes</td>
<td></td>
<td>Yes</td>
<td></td>
</tr>
<tr>
<td>Cassandra</td>
<td>Yes</td>
<td></td>
<td>Yes</td>
<td></td>
</tr>
<tr>
<td>Riak</td>
<td>Yes</td>
<td></td>
<td>Yes</td>
<td></td>
</tr>
<tr>
<td>VoltDB/H-Store</td>
<td></td>
<td>Yes</td>
<td></td>
<td>Yes</td>
</tr>
<tr>
<td>Megastore</td>
<td></td>
<td>Yes</td>
<td></td>
<td>Yes</td>
</tr>
<tr>
<td>MongoDB</td>
<td style="color: red;">Yes</td>
<td></td>
<td></td>
<td>Yes</td>
</tr>
<tr>
<td>PNUTS</td>
<td></td>
<td>Yes</td>
<td style="color: red;">Yes</td>
<td></td>
</tr>
</tbody></table>

<img src="images/truth-of-cap-theorem-pacelc.jpg" height="400px" style="display: block; margin: 0 auto;"/>

<!--
* The default versions of Dynamo, Cassandra, and Riak are PA/EL systems: if a partition occurs, they give up consistency for availability, and under normal operation they give up consistency for lower latency.
* Fully ACID systems such as VoltDB/H-Store and Megastore are PC/EC: they refuse to give up consistency, and will pay the availability and latency costs to achieve it. BigTable and related systems such as HBase are also PC/EC.    MongoDB can be classified as a PA/EC system. In the baseline case, the system guarantees reads and writes to be consistent.
* PNUTS is a PC/EL system.
-->
