
enum ImageType { asset, file, network }

enum HangmanStates {state0, state1, state2, state3, state4, state5, state6}

const List<String> keyboardKeys = [
  'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
  'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
];

const List<String> wordLibrary =  [
'abandon', 'keen', 'jealous', 'tact', 'oath', 'vacant', 'hardship', 'gallant', 'data', 'unaccustomed',
'bachelor', 'qualify', 'corpse', 'conceal', 'dismal', 'frigid', 'inhabit', 'numb', 'peril', 'recline',
'shriek', 'sinister', 'tempt', 'wager', 'typical', 'minimum', 'scarce', 'annual', 'persuade', 'essential',
'blend', 'visible', 'expensive', 'talent', 'devise', 'wholesale', 'vapor', 'eliminate', 'villain', 'dense',
'utilize', 'humid', 'theory', 'descend', 'circulate', 'enormous', 'predict', 'vanish', 'tradition', 'rural',
'burden', 'campus', 'majority', 'assemble', 'explore', 'topic', 'debate', 'evade', 'probe', 'reform',
'approach', 'detect', 'defect', 'employee', 'neglect', 'deceive', 'popular', 'thorough', 'client',
'comprehensive', 'defraud', 'postpone', 'consent', 'massive', 'capsule', 'preserve', 'denounce', 'unique',
'torrent', 'resent', 'molest', 'gloomy', 'unforeseen', 'exaggerate', 'amateur', 'mediocre', 'variety',
'valid', 'survive', 'weird', 'prominent', 'security', 'bulky', 'reluctant', 'obvious', 'vicinity',
'century', 'rage', 'document', 'conclude', 'resist', 'lack', 'ignore', 'challenge', 'miniature', 'source',
'excel', 'feminine', 'mount', 'compete', 'dread', 'masculine', 'menace', 'tendency', 'underestimate',
'victorious', 'numerous', 'flexible', 'evidence', 'solitary', 'vision', 'frequent', 'glimpse', 'recent',
'decade', 'hesitate', 'absurd', 'conflict', 'minority', 'fiction', 'ignite', 'abolish', 'urban',
'population', 'frank', 'pollute', 'reveal', 'prohibit', 'urgent', 'adequate', 'decrease', 'audible',
'journalist', 'famine', 'revive', 'commence', 'observant', 'identify', 'migrate', 'vessel', 'persist',
'hazy', 'gleam', 'editor', 'rival', 'violent', 'brutal', 'opponent', 'brawl', 'duplicate', 'vicious',
'whirl', 'underdog', 'thrust', 'expand', 'alter', 'bewildered', 'mature', 'sacred', 'revise', 'pledge',
'casual', 'pursue', 'unanimous', 'fortunate', 'pioneer', 'innovative', 'slender', 'surpass', 'vast',
'doubt', 'capacity', 'penetrate', 'pierce', 'accurate', 'microscope', 'grateful', 'cautious', 'confident',
'appeal', 'addict', 'wary', 'aware', 'misfortune', 'avoid', 'wretched', 'keg', 'nourish', 'harsh',
'quantity', 'tragedy', 'pedestrian', 'glance', 'budget', 'nimble', 'manipulate', 'reckless', 'horrid',
'rave', 'economy', 'lubricate', 'genius', 'harvest', 'abundant', 'uneasy', 'calculate', 'absorb',
'estimate', 'morsel', 'quota', 'threat', 'panic', 'ban', 'appropriate', 'emerge', 'jagged', 'linger',
'ambush', 'crafty', 'defiant', 'vigor', 'perish', 'fragile', 'captive', 'prosper', 'devour', 'plea',
'weary', 'collide', 'confirm', 'verify', 'anticipate', 'dilemma', 'detour', 'merit', 'transmit',
'relieve', 'baffle', 'warden', 'acknowledge', 'justice', 'delinquent', 'reject', 'deprive', 'spouse',
'vocation', 'unstable', 'homicide', 'penalize', 'beneficiary', 'reptile', 'forbid', 'logical', 'exhibit',
'proceed', 'precaution', 'extract', 'prior', 'embrace', 'valiant', 'partial', 'fierce', 'detest',
'sneer', 'scowl', 'encourage', 'consider', 'vermin', 'wail', 'symbol', 'authority', 'neutral', 'trifle',
'architect', 'matrimony', 'baggage', 'squander', 'abroad', 'fugitive', 'calamity', 'pauper', 'envy',
'collapse', 'prosecute', 'possible', 'compel', 'awkward', 'venture', 'awesome', 'guide', 'quench',
'betray', 'utter', 'pacify', 'respond', 'beckon', 'despite', 'disrupt', 'rash', 'rapid', 'exhaust',
'severity', 'feeble', 'unite', 'cease', 'thrifty', 'miserly', 'monarch', 'outlaw', 'promote', 'illustrate',
'disclose', 'excessive', 'disaster', 'censor', 'culprit', 'juvenile', 'bait', 'insist', 'toil', 'blunder',
'daze', 'mourn', 'subside', 'maim', 'comprehend', 'commend', 'final', 'exempt', 'vain', 'repetition',
'depict', 'mortal', 'novel', 'occupant', 'appoint', 'quarter', 'site', 'quote', 'verse', 'morality', 'roam',
'attract', 'commuter', 'confine', 'idle', 'idol', 'jest', 'patriotic', 'dispute', 'valor', 'lunatic',
'vein', 'uneventful', 'fertile', 'refer', 'distress', 'diminish', 'maximum', 'flee', 'vulnerable',
'signify', 'mythology', 'colleague', 'torment', 'provide', 'loyalty', 'volunteer', 'prejudice', 'shrill', 'jolly', 'witty', 'hinder', 'lecture', 'abuse', 'mumble', 'mute', 'retain', 'candidate',
  'precede', 'adolescent', 'radical', 'spontaneous', 'skim', 'vaccinate', 'untidy', 'utensil', 'sensitive',
  'temperate', 'vague', 'elevate', 'lottery', 'finance', 'obtain', 'cinema', 'event', 'discard', 'soar',
  'subsequent', 'relate', 'stationary', 'prompt', 'hasty', 'scorch', 'tempest', 'soothe', 'sympathetic',
  'redeem', 'resume', 'harmony', 'refrain', 'illegal', 'narcotic', 'heir', 'majestic', 'dwindle', 'surplus',
  'traitor', 'deliberate', 'vandal', 'drought', 'abide', 'unify', 'summit', 'heed', 'biography', 'drench',
  'swarm', 'wobble', 'tumult', 'kneel', 'dejected', 'obedient', 'recede', 'tyrant', 'charity', 'verdict',
  'unearth', 'depart', 'coincide', 'cancel', 'debtor', 'legible', 'placard', 'contagious', 'clergy', 'customary',
  'transparent', 'scald', 'epidemic', 'obesity', 'magnify', 'obstacle', 'ventilate', 'jeopardize', 'negative',
  'pension', 'vital', 'municipal', 'oral', 'complacent', 'wasp', 'rehabilitate', 'parole', 'vertical',
  'multitude', 'nominate', 'potential', 'morgue', 'preoccupied', 'upholstery', 'indifference', 'maintain',
  'snub', 'endure', 'wrath', 'expose', 'legend', 'ponder', 'resign', 'drastic', 'wharf', 'amend', 'ballot'
];
