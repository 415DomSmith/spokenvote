describe 'StartController Tests', ->
  $provide = undefined
  beforeEach module 'spokenvote', 'spokenvoteMocks', (_$provide_) ->
    $provide = _$provide_
    -> $provide.value '$route'

  $httpBackend = undefined
  beforeEach inject (_$httpBackend_) ->
    $httpBackend = _$httpBackend_

  describe 'StartController performs its Controller tasks ', ->
    $rootScope = undefined
    $scope = undefined
    $controller = undefined
    svUtility = undefined
#    Focus = undefined

    beforeEach inject (_$rootScope_, _$controller_, _$httpBackend_, _SessionSettings_, _svUtility_) ->
      $rootScope = _$rootScope_
      $rootScope.sessionSettings = _SessionSettings_
      svUtility = _svUtility_
      #      $location = _$location_
      #      VotingService = _VotingService_
      #      Proposal = _Proposal_
      $rootScope.alertService =
        clearAlerts: jasmine.createSpy 'alertService:clearAlerts'
        setInfo: jasmine.createSpy 'alertService:setInfo'
        setCtlResult: jasmine.createSpy 'alertService:setCtlResult'
        setSuccess: jasmine.createSpy 'alertService:setSuccess'
        setJson: jasmine.createSpy 'alertService:setJson'
      $rootScope.currentUser =
        id: 5
      $scope = $rootScope.$new()
#      Focus = jasmine.createSpy 'Focus'

      $provide.value '$route',
        current:
          params:
            hub: '2'

      $controller = _$controller_

      $controller 'StartController',
        $scope: $scope
#        Focus: Focus

    it 'StartController should initialize', ->
      expect $rootScope.alertService.clearAlerts.calls.count()
        .toEqual 1
      expect svUtility
        .toBeDefined()
#      expect $scope.commentStep
#        .toBeDefined()
#      expect $scope.hubStep
#        .toBeDefined()
#      expect $scope.finishProp
#        .toBeDefined()
      expect $scope.sessionSettings.newVote
        .toEqual {}

    it 'sessionSettings.newVote.parent_id should be undefined', ->
      $scope.sessionSettings.newVote.parent_id = 156

      $controller 'StartController',
        $scope: $scope

      expect $rootScope.sessionSettings.newVote.parent_id
        .toBeUndefined()

#    it 'StartController should focus proposal statement', ->
#      expect Focus
#        .toHaveBeenCalledWith '#proposal_statement'
#      expect Focus.calls.count()
#        .toEqual 1
