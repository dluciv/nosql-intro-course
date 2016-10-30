## ACID vs BASE II

<table>
<thead><tr>
<th>ACID</th><th>BASE</th>
</tr></thead>
<tbody><tr>
<td>Strong consistency<br/>
Isolation<br/>
Focus on “commit”<br/>
Nested transactions<br/>
Availability?<br/>
Conservative (pessimistic)<br/>
Diffcult evolution (e.g. schema)
</td>
<td>
Weak consistency – stale data OK<br/>
Availability ﬁrst<br/>
Best effort<br/>
Approximate answers OK<br/>
Aggressive (optimistic)<br/>
Simpler!<br/>
Faster<br/>
Easier evolution
</td>
</tr></tbody>
</table>
