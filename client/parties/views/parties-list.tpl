<form>
  <label>Name</label>
  <input ng-model="newParty.name">
  <label>Description</label>
  <input ng-model="newParty.description">
  <label>Public</label>
  <input type="checkbox" ng-model="newParty.public">
  <button ng-click="newParty.owner=$root.currentUser._id;parties.push(newParty)">Add</button>
</form>
<ul>
  Parties:
  <div>
    Search
    <input type="search" ng-model="search">
    <select ng-model="orderProperty">
      <option value="name">Ascending</option>
      <option value="-name">Descending</option>
    </select>
  </div>
  <li ng-repeat="party in parties | filter:search | orderBy:orderProperty">
    <a href="/parties/{{party._id}}">{{party.name}}</a>
    <p>{{party.description}}</p>
    <button ng-click="remove(party)">X</button>
    <div>
      <input type="button" value="I'm going!" ng-click="rsvp(party._id, 'yes')">
      <input type="button" value="Maybe" ng-click="rsvp(party._id, 'maybe')">
      <input type="button" value="No" ng-click="rsvp(party._id, 'no')">
    </div>
    <div>
      Who is coming:
      Yes - {{ (party.rsvps | filter:{rsvp:'yes'}).length }}
      Maybe - {{ (party.rsvps | filter:{rsvp:'maybe'}).length }}
      No - {{ (party.rsvps | filter:{rsvp:'no'}).length }}
      <div ng-repeat="rsvp in party.rsvps | filter:{rsvp:'yes'}">
        {{ getUserById(rsvp.user) | displayName }} - {{ rsvp.rsvp }}
      </div>
      <div ng-repeat="rsvp in party.rsvps | filter:{rsvp:'maybe'}">
        {{ getUserById(rsvp.user) | displayName }} - {{ rsvp.rsvp }}
      </div>
      <div ng-repeat="rsvp in party.rsvps | filter:{rsvp:'no'}">
        {{ getUserById(rsvp.user) | displayName }} - {{ rsvp.rsvp }}
      </div>
    </div>
    <ul>
      Users who not responded:
      <li ng-repeat="invitedUser in outstandingInvitations(party)">
        {{ invitedUser | displayName }}
      </li>
    </ul>

    <p><small>Posted by {{ creator(party) | displayName }}</small></p>
  </li>
</ul>
