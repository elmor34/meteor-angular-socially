Here you will see and change the details of the party:

<input ng-model="party.name">
<input ng-model="party.description">
<label>Is public</label>
<input type="checkbox" ng-model="party.public">

<ul>
  Users to invite:
  <li ng-repeat="user in users | uninvited:party">
    <div>{{ user | displayName }}</div>
    <button ng-click="invite(user)">Invite</button>
  </li>
</ul>