Pod::Spec.new do |s|
    s.name         = 'Objective-LevelDB+Uber'
    s.version      = '2.1.6'
    s.license      = 'MIT'
    s.summary      = 'A feature-complete wrapper for LevelDB in Objective-C.'
    s.description  = 'This is a feature-complete wrapper for Google\'s LevelDB. LevelDB is a fast key-value store written by Google.'
    s.homepage     = 'https://github.com/uber/Objective-LevelDB'
    s.authors      = 'Michael Hoisie', 'Mathieu D\'Amours'

    s.ios.deployment_target = '5.0'
    s.osx.deployment_target = '10.7'

    s.source       = {
        :git => 'https://github.com/uber/Objective-LevelDB.git',
        :tag => s.version.to_s
    }

    s.source_files = 'Classes/*.{h,m,mm}'
    s.requires_arc = false

    s.subspec "leveldb" do |sp|
        sp.source_files         = 'Libraries/leveldb/**/*.h'
        sp.vendored_libraries   = 'Libraries/leveldb/libleveldb.a'
        sp.header_dir           = 'leveldb'
        sp.xcconfig = {
            'CC' => 'clang',
            'CXX' => 'clang++',
            'OTHER_LDFLAGS' => '-lc++'
        }
    end

end
