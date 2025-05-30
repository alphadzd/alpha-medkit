local Translations = {
    error = {
        no_medkit = 'You need a medkit to revive someone',
        too_far = 'You are too far away from the person',
        time_expired = 'The 60-second window for revival has expired',
        player_alive = 'This person is already alive',
        revive_failed = 'You failed to revive %s',
    },
    success = {
        revive_success = 'You have successfully revived %s',
    },
    info = {
        using_medkit = 'Using medkit...',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
}) 