const cards = document.querySelectorAll('.memory-card');

let hasFlippedCard = false;
let firstCard, secondCard;

function flipCard()
{
    if (lockBoard) return;
    if (this === firstCard) return;

    this.classList.toggle('flip');

    if (!hasFlippedCard)
    {
        //first click
        hasFlippedCard = true;
        firstCard = this;
    } 
    else 
    {
        //second click
        secondCard = this;
    }
}

cards.forEach(card => card.addEventListener('click', flipCard))