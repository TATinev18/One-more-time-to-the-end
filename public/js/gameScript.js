const cards = document.querySelectorAll('.memory-card');

let hasFlippedCard = false;
let lockBoard = false;
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

        //do cards match
        checkForMatch();
    }
}

function checkForMatch()
{
    if (firstCard.dataset.framework === secondCard.dataset.framework )
        {
            //It's a match
            disableCards();
        } 
        else 
        {
            //not match
            unFlipCards();
        }
}

function disableCards()
{
    firstCard.removeEventListener('click', flipCard);
    secondCard.removeEventListener('click', flipCard);

    resetBoard();
}

function unFlipCards()
{
    lockBoard = true;
    setTimeout(() => {
        firstCard.classList.remove('flip');
        secondCard.classList.remove('flip');

        resetBoard();
    }, 1000);
}

function resetBoard()
{
    [hasFlippedCard, lockBoard] = [false,false];
    [firstCard,secondCard] = [null, null];
}

function restartGame()
{
    location.reload();
}

// Immediately Invoked Function Expression, it will be executed right after it's definition
(function shuffle()
{
    cards.forEach(card => {
        let randomPos = Math.floor(Math.random()*12);
        card.style.order = randomPos;
    });
})();

cards.forEach(card => card.addEventListener('click', flipCard))