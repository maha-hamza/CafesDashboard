package com.websystique.springmvc.cron;

import java.util.Date;
import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.websystique.springmvc.pojos.OffersAndEvent;
import com.websystique.springmvc.repositories.OffersRepository;

@Component
public class DailyCheckCron {

    @Autowired
    private OffersRepository offersRepository;

    @Scheduled(cron = "0 0 */3 * * *")
    public void doChecks() {
	System.out.println("Check offers");
	Iterator<OffersAndEvent> offers = offersRepository.findAll().iterator();
	while (offers.hasNext()) {
	    OffersAndEvent offer = offers.next();
	    if (new Date().after(offer.getEndAt())) {
		offer.setUpdatedAt(new Date());
		offer.setIsDeleted(Byte.parseByte("1"));
		offersRepository.save(offer);

	    }
	}

    }

}
