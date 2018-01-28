use_bpm 115

live_loop :bass do
  ##| with_fx :lpf, cutoff: 60, cutoff_slide: 64 do |e|
  ##|   control e, cutoff: 130
  ##|   16.times do
  7.times do
    t = ring(0.75, 0.25, 0.5, 1, 0.5, 0.25, 0.75).tick
    k = 7
    with_fx :slicer, phase: 0.5, wave: 0, mix: 1 do
      ##| synth :saw,  note: (knit :a1, k, :d1, k, :e1, k, :c1, k).look, sustain: 0, release: t, amp: 5
      ##| synth :dsaw, note: (knit :a2, k, :d2, k, :e2, k, :c2, k).look, sustain: t, release: 0, amp: 5, detune: 0.2, cutoff: 110
      
    end
    synth :fm, note: (knit :a2, k, :d2, k, :e2, k, :c2, k).look, sustain: 0, release: t, amp: 6, depth: 3
    sleep t
  end
  ##|   end
  ##| end
end

in_thread do
  live_loop :beat do
    2.times do
      ##| sample :bd_haus, amp: 10, cutoff: 75
      ##| sample :sn_dub, amp: ring(0,4).tick, rate: 1
      sleep ring(1.5, 0.5).look
      ##| sleep 1
    end
    with_fx :gverb, room: 34, tail_level: 0.9, release: 4, mix: 0.6, damp: 0 do
      sample :elec_ping, amp: ring(4,0).tick, rate: 2
    end
    sleep 2
  end
end

in_thread do
  live_loop :synth2 do
    with_fx :reverb, room: 0.9, mix: 0.5 do
      with_fx :echo, phase: 2, decay: 6, mix: 0.7 do
        3.times do
          ##| synth :zawa, note: choose([62,64,67,69]), attack: 0, sustain: 0, range: 20, release: 0.5, amp: 2, res: 0.6, cutoff: rrand(70, 90)
          ##| synth :zawa, note: choose([62,64,67,69]), attack: 0, sustain: 4, range: 20, release: 0.5, amp: 0.7, res: 0.6, cutoff: rrand(70, 90)
        end
        sleep 4
      end
    end
  end
end

in_thread do
  live_loop :synth3 do
    with_fx :gverb, room: 35, mix: 1 do
      with_fx :slicer, phase: 0.125, wave: 1, pulse_width: 0.12, mix: 1 do
        ##| s = synth :dsaw, note: :g6, note_slide: 16, attack: 16, release: 8, amp: 1, detune: 0.3
        ##| control s, note: :g5
        sleep 16
        ##| stop
      end
    end
  end
end



