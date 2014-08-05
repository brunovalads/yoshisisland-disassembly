def calculate_progress():
    banks = ['tempdis.txt', 'bank01.txt', 'bank02.txt', 'bank04.txt', 'bank05.txt', 'bank06.txt', 'bank07.txt',
    'bank08.txt', 'bank09.txt', 'bank0A.txt', 'bank0B.txt', 'bank0C.txt', 'bank0D.txt', 'bank0E.txt', 'bank0F.txt',
    'bank10.txt', 'bank11.txt', 'bank12.txt', 'bank13.txt', 'bank14.txt', 'bank15.txt', 'bank16.txt', 'bank17.txt',
    'bank18.txt', 'bank19.txt', 'bank1A.txt', 'bank1B.txt', 'bank1C.txt', 'bank1D.txt', 'bank1E.txt', 'bank1F.txt',
    'bank20.txt', 'bank21.txt', 'bank22.txt', 'bank24.txt', 'bank25.txt', 'bank26.txt', 'bank27.txt',
    'bank28.txt', 'bank29.txt', 'bank2A.txt', 'bank2B.txt', 'bank2C.txt', 'bank2D.txt', 'bank2E.txt', 'bank2F.txt',
    'bank30.txt', 'bank31.txt', 'bank32.txt', 'bank33.txt', 'bank34.txt', 'bank35.txt', 'bank36.txt', 'bank37.txt',
    'bank38.txt', 'bank39.txt', 'bank3A.txt', 'bank3B.txt', 'bank3C.txt', 'bank3D.txt', 'bank3E.txt', 'bank3F.txt']

    done_banks = ['bank03.txt', 'bank23.txt']
    comments = 0
    total = 0
    for bank in banks:
        with open(bank, 'r') as f:
            contents = f.read()
            lines = filter(None, contents.split('\n'))
            for line in lines:
                if len(line) <= 0:
                    continue

                if line.startswith(';'):
                    comments += 1
                total += 1

    for bank in done_banks:
        with open(bank, 'r') as f:
            l = len(filter(None, f.read().split('\n')))
            print l
            comments += l
            total += l

    percent = float(comments) / float(total) * 100.0
    print 'Done lines: {0}'.format(comments)
    print 'Total lines: {0}'.format(total)
    print 'Progress: {0}%'.format(percent)

calculate_progress()